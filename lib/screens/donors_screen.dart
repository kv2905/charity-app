import 'package:flutter/material.dart';
import 'package:charityapp/widgets/search_bar.dart';

class DonorScreen extends StatefulWidget {
  static const String id = 'donor_screen';
  @override
  _DonorScreenState createState() => _DonorScreenState();
}

class _DonorScreenState extends State<DonorScreen> {

  SingleCard(Icon icon) {
    return  Container(
      margin: EdgeInsets.all(10),
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            print('Card tapped.');
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
                        onPressed: () {},
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
                childAspectRatio: 2/3,
                crossAxisCount: 2,
                children: [
                  SingleCard(Icon(Icons.add_circle)),
                  SingleCard(Icon(Icons.add_circle)),
                  SingleCard(Icon(Icons.add_circle)),
                  SingleCard(Icon(Icons.add_circle)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

