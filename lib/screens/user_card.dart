import 'package:flutter/material.dart';

class UserCard extends StatefulWidget {
  static const String id = 'user_card';
  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Card',
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
      body: Column (
        children: <Widget>[
          SizedBox(height: 100),
          Text(
            'Sherlock Holmes',
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '233B, BAKER STREET, LONDON',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
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
              child: ListTile(
                leading: Icon(Icons.phone, color: Colors.teal),
                title: Text(
                  '+91 XXXXXXXXXX',
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
                leading: Icon(Icons.email, color: Colors.teal),
                title: Text(
                  'xyz123@gmail.com',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.teal.shade900
                  ),
                ),
              )
          )
        ],
      )
    );
  }
}
