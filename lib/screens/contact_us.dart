import 'package:charityapp/screens/root_page.dart';
import 'package:flutter/material.dart';


class ContactUs extends StatefulWidget {
  static const String id = 'contact_us';
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Contact Us',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF42906A),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, size: 15),
            onPressed: () {
              Navigator.pushNamed(context, RootPage.id);
            },
          ),
        ),
        body: SafeArea(
            child: Column (
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'ABC XYZ',
                  style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
                Text(
                  '123 abc xyz',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.5,
                      color: Colors.teal.shade100
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(
                    color: Colors.teal.shade100,
                  ),
                ),
                Card(
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    color: Colors.white,
                    child: ListTile(
                      leading: Icon(Icons.phone, color: Colors.teal),
                      title: Text(
                        '+91 9876543210',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.teal.shade900
                        ),
                      ),
                    )
                ),
                Card(
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    color: Colors.white,
                    child: ListTile(
                      leading: Icon(Icons.email, color: Colors.teal),
                      title: Text(
                        'abc@xyz.com',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.teal.shade900
                        ),
                      ),
                    )
                )
              ],
            )
        ),
    );
  }
}
