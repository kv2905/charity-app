import 'package:charityapp/models/request.dart';
import 'package:charityapp/screens/request_details.dart';
import 'package:charityapp/screens/root_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseUser loggedInUser;

class RecipientsList extends StatefulWidget {
  static const String id = 'recipient_list';
  @override
  _RecipientsListState createState() => _RecipientsListState();
}

class _RecipientsListState extends State<RecipientsList> {
  final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<Request> requests;
  bool isLoading = false;
  String currentUserEmail;

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        currentUserEmail = loggedInUser.email;
      }
    } catch (e) {
      print(e);
    }
    getRequests();
  }

  getRequests() async {
    var data = await _db.collection('requests').getDocuments();
    print(data.documents.length);
    if (data.documents.length != 0) {
      setState(() {
        requests = data.documents
            .map((doc) => Request.fromMap(doc.data, doc.documentID))
            .toList();
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    isLoading = true;
    getCurrentUser();
    super.initState();
  }

  showCircularProgress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  alertNotAuthorisedToDelete() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text('This request is not made by you!'),
          actions: [
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                int count = 0;
                Navigator.popUntil(context, (route) {
                  return count++ == 2;
                });
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recipients List',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF42906A),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 15,
          ),
          onPressed: () {
            Navigator.pushNamed(context, RootPage.id);
          },
        ),
      ),
      body: isLoading
          ? showCircularProgress()
          : requests == null
              ? Center(
                  child: Text('No Requests'),
                )
              : ListView.builder(
                  itemCount: requests.length,
                  itemBuilder: (BuildContext context, int i) {
                    return GestureDetector(
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Alert'),
                              content: Text('Delete the request?'),
                              actions: [
                                FlatButton(
                                  child: Text('NO'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                FlatButton(
                                  child: Text('YES'),
                                  onPressed: () async {
                                    if (requests[i].recipientID !=
                                        currentUserEmail) {
                                      alertNotAuthorisedToDelete();
                                    } else {
                                      await _db
                                          .collection('requests')
                                          .document(requests[i].id)
                                          .delete();
                                      setState(() {
                                        requests.remove(requests[i]);
                                      });
                                      Navigator.of(context).pop();
                                    }
                                  },
                                )
                              ],
                            );
                          },
                        );
                      },
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                RequestDetails(request: requests[i]),
                          ),
                        );
                      },
                      child: ListTile(
                        title: Text('Request ${i + 1}'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    );
                  },
                ),
    );
  }
}
