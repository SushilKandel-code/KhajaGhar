import 'dart:io';
import 'package:flutter/material.dart';
import 'package:jsend/api_request.dart';
import 'package:khajaghar/screens/change_password.dart';
import 'screens/login.dart';
import 'screens/register.dart';
import 'constants.dart';
import 'screens/forgot_password.dart';

void main() {
  APIRequest.base = 'http://192.168.1.81:3000/api/abcd/auth/';
  runApp(KhajaGhar());
}

class KhajaGhar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/register': (context) => Register(),
        '/forgotpassword': (context) => ForgotPassword(),
        '/changepassword': (context) => ChangePassword()
      },
      home: Scaffold(
        backgroundColor: Color(kBackgroundColor),
        body: LoginPage(),
      ),
      // initialRoute: '/changepassword',
    );
  }
}

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext securityContext) {
//     return new HttpClient(context: securityContext)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }
