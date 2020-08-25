import 'package:charityapp/models/donation.dart';
import 'package:charityapp/screens/item_details.dart';
import 'package:charityapp/screens/request_form.dart';
import 'package:charityapp/widgets/app_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RecipientScreen extends StatefulWidget {
  static const String id = 'recipient_screen';
  @override
  _RecipientScreenState createState() => _RecipientScreenState();
}

class _RecipientScreenState extends State<RecipientScreen> {
  final Firestore _db = Firestore.instance;
  List<Donation> donations;
  bool _isLoading;

  getDonations() async {
    var data = await _db.collection('donations').getDocuments();
    setState(() {
      donations = data.documents
          .map((doc) => Donation.fromMap(doc.data, doc.documentID))
          .toList();
      _isLoading = false;
    });
  }

  @override
  void initState() {
    _isLoading = true;
    getDonations();
    super.initState();
  }

  Widget donationCard(Donation donation) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetails(donation: donation, type: 'donation'),
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
      body: _isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'People Donations',
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
                                Navigator.pushNamed(context, RequestForm.id);
                              },
                              iconSize: 50,
                            ),
                            Text(
                              'add request',
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
                    stream: _db.collection('donations').snapshots(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                            child: const Text('Loading donations...'));
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
                          return donationCard(temp);
                        },
                        itemCount: snapshot.data.documents.length,
                      );
                    },
                  ))
                ],
              ),
            ),
    );
  }
}
