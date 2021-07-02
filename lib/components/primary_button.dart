import 'package:flutter/material.dart';
import 'package:khajaghar/constants.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  PrimaryButton({@required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(5),
      // color: Colors.black,
      width: double.infinity,
      child: ElevatedButton(
        child: Text(title),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: kPrimaryColor,
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }
}
