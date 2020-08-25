import 'package:charityapp/models/donation.dart';
import 'package:charityapp/screens/donation_form.dart';
import 'package:charityapp/widgets/app_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'item_details.dart';

FirebaseUser loggedInUser;

class DonorScreen extends StatefulWidget {
  static const String id = 'donor_screen';
  @override
  _DonorScreenState createState() => _DonorScreenState();
}

class _DonorScreenState extends State<DonorScreen> {
  final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading;
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
    setState(() {
      isLoading = false;
    });
  }

  Widget donationCard(Donation donation) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ItemDetails(donation: donation, type: 'donation'),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  donation.img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              donation.name.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    isLoading = true;
    getCurrentUser();
    print(currentUserEmail);
    super.initState();
  }

  showCircularProgress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Charity App'),
        centerTitle: true,
        backgroundColor: Color(0xFF5D637A),
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xFF5D637A),
        ),
        child: AppDrawer(),
      ),
      body: isLoading
          ? showCircularProgress()
          : SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Your Donations',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.add_circle,
                                color: Color(0xFF5D637A),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, DonationForm.id);
                              },
                              iconSize: 50,
                            ),
                            Text(
                              'add item',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                      child: StreamBuilder(
                    stream: _db.collection('donations').where('donorID', isEqualTo: currentUserEmail).snapshots(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                            child: const Text(
                                'No donations has been made by you.'),
                        );
                      }
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemBuilder: (BuildContext context, int index) {
                          Donation temp = Donation(
                              name: snapshot.data.documents[index]['name'],
                              img: snapshot.data.documents[index]['img'],
                              donorID: snapshot.data.documents[index]
                                  ['donorID'],
                              donorAddress: snapshot.data.documents[index]
                                  ['donorAddress'],
                              donorContact: snapshot.data.documents[index]
                                  ['donorContact'],
                              donorName: snapshot.data.documents[index]
                                  ['donorName'],
                              quantity: snapshot.data.documents[index]
                                  ['quantity']);
                          if (temp.donorID == currentUserEmail)
                            return donationCard(temp);
                          return donationCard(temp);
                        },
                        itemCount: snapshot.data.documents.length,
                      );
                    },
                  )),
                  SizedBox(height: 20),
                  Text(
                    'Recipients Request',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: GridView.count(
                      childAspectRatio: 9 / 10,
                      crossAxisCount: 2,
                      children: [
//                  _SingleCard(Icon(Icons.add_circle)),
//                  _SingleCard(Icon(Icons.add_circle)),
//                  _SingleCard(Icon(Icons.add_circle)),
//                  _SingleCard(Icon(Icons.add_circle)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
