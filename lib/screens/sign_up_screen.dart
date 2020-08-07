import 'package:charityapp/screens/sign_in_screen.dart';
import 'package:charityapp/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupScreen extends StatefulWidget {
  static const String id = 'signup_screen';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5D637A),
        centerTitle: true,
        title: Text(
          'Sign up',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 15,
          ),
          onPressed: () {
            SystemNavigator.pop();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(5),
            color: Colors.white70,
            height: 40,
            child: Text(
              'Charity App',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w700,
                  fontSize: 19),
            ),
          ),
          SizedBox(height: 8),
          SignupForm(),
          SizedBox(height: 30),
          Center(
            child: FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, SigninScreen.id);
              },
              child: Text('Already have an account? Signin'),
            )
          ),
        ],
      ),
    );
  }
}
