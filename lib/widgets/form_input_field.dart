import 'package:flutter/material.dart';

class FormInputField extends StatelessWidget {
  FormInputField({@required this.fieldName, this.onTap, this.onSaved, this.validator});
  final String fieldName;
  final Function onTap, onSaved, validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      child: TextFormField(
        autofocus: false,
        style: TextStyle(fontSize: 15.0, color: Colors.black),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: fieldName,
          filled: true,
          fillColor: Colors.white70,
          contentPadding:
          const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black38),
              borderRadius: BorderRadius.zero),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.zero),
        ),
        validator: validator,
        onTap: onTap,
        onSaved: onSaved,
      ),
    );
  }
}