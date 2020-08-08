import 'package:charityapp/screens/donors_screen.dart';
import 'package:charityapp/widgets/custom_button.dart';
import 'package:charityapp/widgets/form_input_field.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatefulWidget {
  static const String id = 'signin_screen';

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Sign in',
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
      body: Column(
        children: [
          SizedBox(height: 100),
          Container(
            padding: EdgeInsets.all(5),
            height: 40,
            child: Text(
              'Charity App Signin',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            height: 90,
            child: Text(
              'Offer something for free(e.g. meal, clothes) or express what you want',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.w400,
                fontSize: 19,
              ),
            ),
          ),
          Form(
            child: Column(
              children: [
                FormInputField(
                  fieldName: 'Email*',
                ),
                FormInputField(
                  fieldName: 'Choose Password*',
                ),
                SizedBox(height: 70),
                Container(
                  width: 250,
                  alignment: Alignment.center,
                  child: Text(
                    '* By proceeding you also agree to the Terms of Service and Privacy Policy.',
                  ),
                ),
                SizedBox(height: 20),
                CustomButton(
                  buttonName: 'Sign in',
                  onPressed: () {
                    Navigator.pushNamed(context, DonorScreen.id);
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
