import 'package:charityapp/screens/donation_form.dart';
import 'package:charityapp/screens/donors_screen.dart';
import 'package:charityapp/screens/item_details.dart';
import 'package:charityapp/screens/recipient_screen.dart';
import 'package:charityapp/screens/recipients_list_screen.dart';
import 'package:charityapp/screens/request_form.dart';
import 'package:charityapp/screens/sign_in_screen.dart';
import 'package:charityapp/screens/sign_up_screen.dart';
import 'package:charityapp/screens/user_card.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Charity App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white70
      ),
      initialRoute: SignupScreen.id,
      routes: {
        SignupScreen.id: (context) => SignupScreen(),
        SigninScreen.id: (context) => SigninScreen(),
        DonorScreen.id: (context) => DonorScreen(),
        DonationForm.id: (context) => DonationForm(),
        RecipientsList.id: (context) => RecipientsList(),
        UserCard.id: (context) => UserCard(),
        RecipientScreen.id: (context) => RecipientScreen(),
        RequestForm.id: (context) => RequestForm(),
        ItemDetails.id: (context) => ItemDetails(),
      },
    );
  }
}
