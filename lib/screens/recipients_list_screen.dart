import 'package:flutter/material.dart';

class RecipientsList extends StatefulWidget {
  static const String id = 'recipient_list';
  @override
  _RecipientsListState createState() => _RecipientsListState();
}

class _RecipientsListState extends State<RecipientsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recipients List',
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
      body: ListView(
        children: [
          ListTile(
            title: Text('Recipient 1'),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: (){
//                Navigator.pushNamed(context, UserCard.id);
              },
            ),
          ),
          ListTile(
            title: Text('Recipient 2'),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: (){},
            ),
          ),
          ListTile(
            title: Text('Recipient 3'),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: (){},
            ),
          ),
          ListTile(
            title: Text('Recipient 4'),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: (){},
            ),
          ),
          ListTile(
            title: Text('Recipient 5'),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: (){},
            ),
          ),
        ],
      ),
    );
  }
}
