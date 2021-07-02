import 'package:flutter/material.dart';
import 'package:khajaghar/components/primary_button.dart';
import 'package:khajaghar/constants.dart';
import 'package:khajaghar/components/input_field_container.dart';

class ChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Password',
          style: TextStyle(color: kPrimaryColor),
        ),
        iconTheme: IconThemeData(color: kPrimaryColor),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              'Enter your new Password',
              style: kMediumTextStyle,
            ),
            InputTextField(
              hintText: 'Your New Password',
              obsecureText: true,
            ),
            InputTextField(
              hintText: 'Confirm New Password',
              obsecureText: true,
            ),
            SizedBox(
              height: 20.0,
            ),
            PrimaryButton(title: 'Change Password')
          ],
        ),
      ),
    );
  }
}
