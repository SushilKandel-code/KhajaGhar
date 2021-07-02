import 'package:flutter/material.dart';
import 'package:khajaghar/constants.dart';

class InputTextField extends StatelessWidget {
  final String hintText;
  final bool obsecureText;

  InputTextField({@required this.hintText, this.obsecureText = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        boxShadow: [kBoxShadow],
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(16),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
