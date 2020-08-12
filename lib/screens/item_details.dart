import 'package:charityapp/screens/user_card.dart';
import 'package:charityapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatefulWidget {
  static const String id = 'item_details';
  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              child: Container(
                height: 200,
                child: Center(
                  child: Text('image'),
                ),
              ),
            ),
          ),
          Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                title: Text(
                  'Name',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.teal.shade900
                  ),
                ),
              )
          ),
          Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                title: Text(
                  'Quantity',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.teal.shade900
                  ),
                ),
              )
          ),
          SizedBox(height: 50),
          CustomButton(
            buttonName: 'Connect Donor',
            onPressed: (){
              Navigator.pushNamed(context, UserCard.id);
            },
          )
        ],
      ),
    );
  }
}
