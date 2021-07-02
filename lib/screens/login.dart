import 'package:flutter/material.dart';
import 'package:khajaghar/constants.dart';
import 'package:khajaghar/components/input_field_container.dart';
import 'package:khajaghar/components/primary_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // height: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome!",
              style: kBoldTextStyle,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text("Login to continue"),
            SizedBox(
              height: 20.0,
            ),
            InputTextField(
              hintText: 'Email or Phone Number',
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [kBoxShadow],
              ),
              child: TextField(
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  // labelText: "Password",
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  hintText: "Password",
                  suffix: IconButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      setState(() {
                        _obsecureText = !_obsecureText;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye_outlined,
                      size: 20.0,
                    ),
                  ),
                ),
                obscureText: _obsecureText,
                enableSuggestions: false,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: Text(
                  'Forgot your password?',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.normal),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/forgotpassword');
                },
              ),
            ),
            PrimaryButton(
              title: 'Login',
              onPressed: () {
                print("Login Button Pressed");
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'New to KhajaGhar?',
                  style: TextStyle(color: Color(0xff686868)),
                ),
                TextButton(
                  child: Text(
                    'Register now',
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
