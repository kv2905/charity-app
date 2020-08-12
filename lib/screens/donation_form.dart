import 'package:charityapp/widgets/custom_button.dart';
import 'package:charityapp/widgets/form_input_field.dart';
import 'package:flutter/material.dart';

class DonationForm extends StatefulWidget {
  static const String id = 'donation_form';
  @override
  _DonationFormState createState() => _DonationFormState();
}

class _DonationFormState extends State<DonationForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Donation Form',
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(20),
            width: 400,
            child: Text(
              'Add an item to the donation list',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
          Form(
            child: Column(
              children: [
                FormInputField(
                  fieldName: 'Choose a item to donate',
                ),
                FormInputField(
                  fieldName: 'Quantity',
                ),
                FormInputField(
                  fieldName: 'Contact Number',
                ),
                FormInputField(
                  fieldName: 'Location',
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Choose Photo', style: TextStyle(fontWeight: FontWeight.bold),),
                    IconButton(
                      icon: Icon(Icons.add_a_photo),
                      onPressed: (){},
                    ),
                    IconButton(
                      icon: Icon(Icons.add_photo_alternate),
                      onPressed: (){},
                    ),
                  ],
                ),
                SizedBox(height: 70),
                CustomButton(
                  buttonName: 'Submit',
                  onPressed: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
