import 'package:charityapp/screens/recipient_screen.dart';
import 'package:charityapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:charityapp/widgets/form_input_field.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          FormInputField(
            fieldName: 'User Type',
          ),
          FormInputField(
            fieldName: 'User Name',
          ),
          FormInputField(
            fieldName: 'Mobile No',
          ),
          FormInputField(
            fieldName: 'Email*',
          ),
          FormInputField(
            fieldName: 'Choose Password*',
          ),
          FormInputField(
            fieldName: 'Repeat Password*',
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.check),
                    Text('Has at least 8 characters'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.check),
                    Text('Has at least 1 number'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          Container(
            width: 250,
            alignment: Alignment.center,
            child: Text(
              '* By proceeding you also agree to the Terms of Service and Privacy Policy.',
            ),
          ),
          SizedBox(height: 10),
          CustomButton(
            buttonName: 'Sign up',
            onPressed: () {
              Navigator.pushNamed(context, RecipientScreen.id);
            },
          )
        ],
      ),
    );
  }
}
