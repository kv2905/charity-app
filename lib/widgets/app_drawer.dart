import 'package:charityapp/screens/donors_screen.dart';
import 'package:charityapp/screens/recipient_screen.dart';
import 'package:charityapp/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:charityapp/widgets/option_tile.dart';

class AppDrawer extends StatefulWidget {
  AppDrawer({this.auth, this.logoutCallback});
  final BaseAuth auth;
  final VoidCallback logoutCallback;
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {

  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                leading: Icon(Icons.clear),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              OptionTile(
                onTap: () {
                  Navigator.pushNamed(context, DonorScreen.id);
                },
                optionName: 'Donate',
              ),
              OptionTile(
                onTap: () {
                  Navigator.pushNamed(context, RecipientScreen.id);
                },
                optionName: 'Request',
              ),
              OptionTile(
                onTap: () {},
                optionName: 'Covid-19',
              ),
              OptionTile(
                onTap: () {},
                optionName: 'About us',
              ),
              OptionTile(
                onTap: () {
                  signOut();
                },
                optionName: 'LogOut',
              )
            ],
          ),
        ),
      ),
    );
  }
}
