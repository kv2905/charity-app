import 'package:charityapp/models/donation.dart';
import 'package:charityapp/models/request.dart';
import 'package:charityapp/screens/user_card.dart';
import 'package:charityapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  ItemDetails({this.request, this.donation, this.type});
  final Donation donation;
  final Request request;
  final String type;

  String getName() {
    if (type == 'donation') return donation.name;
    return 'Name';
  }

  String getQuantity() {
    if (type == 'donation') return donation.quantity;
    return 'Quantity';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Item Details',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF5D637A),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 15,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                title: Text(
                  'Item Name - ' + getName().toUpperCase(),
                  style: TextStyle(fontSize: 20.0, color: Colors.teal.shade900),
                ),
              )),
          Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                title: Text(
                  'Quantity - ' + getQuantity(),
                  style: TextStyle(fontSize: 20.0, color: Colors.teal.shade900),
                ),
              )),
          SizedBox(height: 30),
          type == 'donation'
              ? Expanded(
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
                )
              : null,
          SizedBox(height: 50),
          CustomButton(
            buttonName: 'Connect Donor',
            onPressed: () {
              if (type == 'donation') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserCard(
                      name: donation.donorName,
                      address: donation.donorAddress,
                      email: donation.donorID,
                      phone: donation.donorContact,
                    ),
                  ),
                );
              }
            },
          ),
          SizedBox(height: 100)
        ],
      ),
    );
  }
}
