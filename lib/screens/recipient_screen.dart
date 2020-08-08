import 'package:charityapp/screens/item_details.dart';
import 'package:charityapp/screens/request_form.dart';
import 'package:charityapp/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class RecipientScreen extends StatefulWidget {
  static const String id = 'recipient_screen';
  @override
  _RecipientScreenState createState() => _RecipientScreenState();
}

class _RecipientScreenState extends State<RecipientScreen> {
  // ignore: non_constant_identifier_names
  _SingleCard(Icon icon) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        child: InkWell(
            splashColor: Colors.blue.withAlpha(30), onTap: () {Navigator.pushNamed(context, ItemDetails.id);}, child: icon),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Charity App',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.add_circle,
                          color: Colors.blue,
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
            SizedBox(height: 10),
            SearchBar(),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                childAspectRatio: 9 / 10,
                crossAxisCount: 2,
                children: [
                  _SingleCard(Icon(Icons.add_circle)),
                  _SingleCard(Icon(Icons.add_circle)),
                  _SingleCard(Icon(Icons.add_circle)),
                  _SingleCard(Icon(Icons.add_circle)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
