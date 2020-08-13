import 'package:charityapp/screens/covid19_pdf_view.dart';
import 'package:charityapp/screens/donation_form.dart';
import 'package:charityapp/screens/donors_screen.dart';
import 'package:charityapp/screens/item_details.dart';
import 'package:charityapp/screens/login_signup_screen.dart';
import 'package:charityapp/screens/recipient_screen.dart';
import 'package:charityapp/screens/recipients_list_screen.dart';
import 'package:charityapp/screens/request_form.dart';
import 'package:charityapp/screens/root_page.dart';
import 'package:charityapp/screens/user_card.dart';
import 'package:charityapp/services/authentication.dart';
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
      initialRoute: RootPage.id,
      routes: {
        RootPage.id: (context) => RootPage(auth: Auth()),
        LoginSignupScreen.id: (context) => LoginSignupScreen(),
        DonorScreen.id: (context) => DonorScreen(),
        DonationForm.id: (context) => DonationForm(),
        RecipientsList.id: (context) => RecipientsList(),
        UserCard.id: (context) => UserCard(),
        RecipientScreen.id: (context) => RecipientScreen(),
        RequestForm.id: (context) => RequestForm(),
        ItemDetails.id: (context) => ItemDetails(),
        Covid19PDFView.id: (context) => Covid19PDFView(),
      },
    );
  }
}
