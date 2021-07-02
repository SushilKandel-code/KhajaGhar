import 'package:flutter/material.dart';
import 'package:khajaghar/constants.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forgot Password',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Please Choose a method',
              style: kMediumTextStyle,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text('Select which contact would you like to send the reset code.'),
            VerificationCardType(
              icon: Icons.phone_in_talk_outlined,
              verificationMethodType: 'Via SMS',
              dummyText: '+977 98*******56',
            ),
            VerificationCardType(
              icon: Icons.email_outlined,
              verificationMethodType: 'Via Email',
              dummyText: 'k**********@gmail.com',
            ),
          ],
        ),
      ),
    );
  }
}

class VerificationCardType extends StatelessWidget {
  final IconData icon;
  final String verificationMethodType;
  final String dummyText;

  VerificationCardType(
      {this.icon, this.verificationMethodType, this.dummyText});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('$verificationMethodType was tapped');
      },
      child: Container(
        margin: EdgeInsets.only(top: 20.0),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [kBoxShadow],
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              // size: 30.0,
              color: kPrimaryColor,
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  verificationMethodType,
                  style: TextStyle(fontSize: 12.0),
                ),
                Text(
                  dummyText,
                  style: TextStyle(fontWeight: FontWeight.w500),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// return Container(
//   margin: EdgeInsets.only(top: 20.0),
//   decoration: BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.circular(10.0),
//     boxShadow: [kBoxShadow],
//   ),
//   child: ListTile(
//     tileColor: Colors.white,
//     leading: Icon(
//       icon,
//       size: 30.0,
//       color: kPrimaryColor,
//     ),
//     contentPadding: EdgeInsets.all(10.0),
//     title: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           verificationMethodType,
//           style: TextStyle(fontSize: 12.0),
//         ),
//         Text(
//           dummyText,
//           style: TextStyle(fontWeight: FontWeight.w500),
//         )
//       ],
//     ),
// );
