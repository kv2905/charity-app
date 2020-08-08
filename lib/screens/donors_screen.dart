import 'package:charityapp/screens/donation_form.dart';
import 'package:charityapp/screens/recipients_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:charityapp/widgets/search_bar.dart';

class DonorScreen extends StatefulWidget {
  static const String id = 'donor_screen';
  @override
  _DonorScreenState createState() => _DonorScreenState();
}

class _DonorScreenState extends State<DonorScreen> {

  // ignore: non_constant_identifier_names
  _SingleCard(Icon icon) {
    return  Container(
      margin: EdgeInsets.all(10),
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Navigator.pushNamed(context, RecipientsList.id);
          },
          child: icon
        ),
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
                    'Welcome Donor!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                          Navigator.pushNamed(context, DonationForm.id);
                        },
                        iconSize: 50,
                      ),
                      Text('add item', style: TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            SearchBar(),
            SizedBox(height: 20),
            Text('Your Donations', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                childAspectRatio: 9/10,
                crossAxisCount: 2,
                children: [
                  _SingleCard(Icon(Icons.add_circle)),
                  _SingleCard(Icon(Icons.add_circle)),
                  _SingleCard(Icon(Icons.add_circle)),
                  _SingleCard(Icon(Icons.add_circle)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('Recipients Request' , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                childAspectRatio: 9/10,
                crossAxisCount: 2,
                children: [
                  _SingleCard(Icon(Icons.add_circle)),
                  _SingleCard(Icon(Icons.add_circle)),
                  _SingleCard(Icon(Icons.add_circle)),
                  _SingleCard(Icon(Icons.add_circle)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

