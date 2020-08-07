import 'package:charityapp/screens/sign_in_screen.dart';
import 'package:charityapp/screens/sign_up_screen.dart';
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
        SigninScreen.id: (context) => SigninScreen()
      },
    );
  }
}
