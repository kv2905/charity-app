import 'package:charityapp/models/request.dart';
import 'package:charityapp/screens/recipients_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RequestDetails extends StatelessWidget {
  RequestDetails({@required this.request});
  final Request request;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Item Details',
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
            Navigator.pushNamed(context, RecipientsList.id);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
              child: Container(
                height: 100,
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.all(10),
                child: Text(request.description, style: TextStyle(color: Colors.teal.shade900, fontSize: 15),),
              ),
            ),
            SizedBox(height: 20),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                title: Text(
                  'Item - ' + request.name.toUpperCase(),
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                title: Text(
                  'Quantity - ' + request.quantity,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                title: Text(
                  'Location - ' + request.recipientAddress,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                title: Text(
                  'Recipient - ' + request.recipientName,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
            Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(Icons.phone, color: Colors.teal),
                  title: Text(
                    request.recipientContact,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white
                    ),
                  ),
                )
            ),
            Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(Icons.email, color: Colors.teal),
                  title: Text(
                    request.recipientID,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
