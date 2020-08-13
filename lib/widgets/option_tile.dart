import 'package:flutter/material.dart';

class OptionTile extends StatelessWidget {
  const OptionTile({@required this.onTap, @required this.optionName});
  final String optionName;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black26,
          border: Border.all(
              color: Colors.black38,
              width: 1.0,
              style: BorderStyle.solid)),
      child: ListTile(
          title: Text(
            optionName,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          ),
          onTap: onTap),
    );
  }
}