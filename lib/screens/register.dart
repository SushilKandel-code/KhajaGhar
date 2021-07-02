import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jsend/api_request.dart';
import 'package:khajaghar/components/primary_button.dart';
import 'package:khajaghar/constants.dart';
import 'package:jsend/jsend.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final fullNameConn = TextEditingController();
  final emailConn = TextEditingController();
  final phoneConn = TextEditingController();
  final passwordConn = TextEditingController();
  final confirmPassConn = TextEditingController();
  jsendResponse lastResponse;

  // RegisterModel registerModel;
  // Album _album;

  void _registerPost() async {
    var apiRequest = APIRequest(
        path: 'register',
        payload: {
          'name': fullNameConn.text.trim(),
          'email': emailConn.text.trim(),
          'phone': phoneConn.text.trim(),
          'confirm_password': confirmPassConn.text,
          'password': passwordConn.text
        },
        method: 'POST');
    var httpResponse = await apiRequest.send();
    var jsonResp = jsendResponse(httpResponse);
    lastResponse = jsonResp;
    if (jsonResp.status == 'success') {
      print('Account Created Successfully');
    } else if (jsonResp.status == 'fail') {
      // validation errors exist
      print('Account Create Failed with validation errors');
      formKey.currentState.validate();
      print('Validation Errors: ' + jsonResp.data.toString());
    } else if (jsonResp.status == 'error') {
      // server error
      print(jsonResp.message);
    }
    // print(jsonResp.data);
  }

  // Future<Album> createUser(String fullname, String email, String phoneNumber,
  //     String password, String confirmPassword) async {
  //   var uri = Uri.parse('http://192.168.1.78:3000/api/abcd/auth/register');

  //   final response = await http.post(
  //     uri,
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'name': fullname,
  //       'email': email,
  //       'phone': phoneNumber,
  //       'confirm_password': confirmPassword,
  //       'password': password,
  //     }),
  //   );
  //   if (response.statusCode == 201) {
  //     final String responseString = response.body;
  //     return albumFromJson(responseString);
  //   } else {
  //     // If the server did not return a 201 CREATED response,
  //     // then throw an exception.
  //     throw Exception('Failed to load album');
  //   }
  // }
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(kBackgroundColor),
      appBar: AppBar(
        title: Text(
          'Register',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Color(kBackgroundColor),
      ),
      body: Form(
        key: formKey,
        child: Container(
          // height: 500,
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: ListView(
            // padding: EdgeInsets.symmetric(horizontal: 30.0),
            children: [
              Text(
                "Welcome!",
                style: kBoldTextStyle,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text("Create a new account"),
              SizedBox(
                height: 20.0,
              ),
              InputFieldsWithIcon(
                  labelText: 'Full Name',

                  // onSaved: (input) => registerModel.fullname = input,
                  icon: Icons.person_outline,
                  textInputType: TextInputType.name,
                  controller: fullNameConn,
                  onValidate: (value) {
                    // if (value.isEmpty) {
                    //   return "Please enter name";
                    // } else if (value.toString().length < 5) {
                    //   return "Name must be between 5 and 40 characters";
                    // }
                    if (lastResponse != null) {
                      if (lastResponse.hasErrorIn("name")) {
                        return lastResponse.errorIn("name");
                      }
                    }
                  }),
              InputFieldsWithIcon(
                labelText: 'Email',
                // onSaved: (input) => registerModel.email = input,
                icon: Icons.mail_outline,
                textInputType: TextInputType.emailAddress,
                controller: emailConn,
                onValidate: (value) {
                  if (value.toString().isEmpty) {
                    return "Email must not be empty";
                  } else if (lastResponse != null) {
                    if (lastResponse.hasErrorIn("email")) {
                      return lastResponse.errorIn("email");
                    }
                  }
                },
              ),
              InputFieldsWithIcon(
                  labelText: 'Phone Number',
                  // onSaved: (input) => registerModel.phoneNumber = input,
                  controller: phoneConn,
                  icon: Icons.phone_outlined,
                  textInputType: TextInputType.phone,
                  onValidate: (value) {
                    if (lastResponse != null) {
                      if (lastResponse.hasErrorIn("phone")) {
                        return lastResponse.errorIn("phone");
                      }
                    }
                  }),
              InputFieldsWithIcon(
                  labelText: 'Password',
                  // onSaved: (input) => registerModel.password = input,
                  controller: passwordConn,
                  icon: Icons.lock_outline,
                  obsecureText: true,
                  onValidate: (value) {
                    if (lastResponse != null) {
                      if (lastResponse.hasErrorIn("password")) {
                        return lastResponse.errorIn("password");
                      }
                    }
                  }),
              InputFieldsWithIcon(
                  labelText: 'Confirm Password',
                  // onSaved: (input) => registerModel.confirmPassword = input,
                  controller: confirmPassConn,
                  icon: Icons.lock_outline,
                  obsecureText: true,
                  onValidate: (value) {
                    if (lastResponse != null) {
                      if (lastResponse.hasErrorIn("confirm_password")) {
                        return lastResponse.errorIn("confirm_password");
                      }
                    }
                  }),
              SizedBox(
                height: 20.0,
              ),
              PrimaryButton(
                  title: 'Register',
                  onPressed: () async {
                    // final String name = fullNameConn.text;
                    // final String email = emailConn.text;
                    // final String phone = phoneConn.text;
                    // final String password = passwordConn.text;
                    // final String confirmPassword = confirmPassConn.text;

                    print(fullNameConn.text);
                    print(emailConn);
                    await _registerPost();
                    setState(() {});

                    // final Album album = await createUser(
                    //     name, email, phone, password, confirmPassword);

                    // setState(() {
                    //   _album = album;
                    // });
                    //
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already Registered?',
                    style: TextStyle(color: Color(0xff686868)),
                  ),
                  TextButton(
                    child: Text(
                      'Login now',
                      style: TextStyle(color: kPrimaryColor),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}

class InputFieldsWithIcon extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final bool obsecureText;
  final TextInputType textInputType;
  final Function onValidate;
  final Function onSaved;
  final TextEditingController controller;

  InputFieldsWithIcon(
      {this.labelText,
      this.icon,
      this.onValidate,
      this.onSaved,
      this.controller,
      this.obsecureText = false,
      this.textInputType = TextInputType.text});
  @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(top: 10.0),
//       child: TextField(
//         decoration: InputDecoration(
//           // contentPadding: EdgeInsets.symmetric(horizontal: 10),
//           labelText: labelText,
//           labelStyle: TextStyle(fontSize: 14.0),
//           filled: true,
//           fillColor: Colors.white,
//           border: InputBorder.none,
//           focusColor: Colors.black,
//           // labelStyle: TextStyle(color: Colors.black),
//           // hintText: labelText,
//           prefixIcon: Icon(icon),
//         ),
//       ),
//     );
//   }
// }
  Widget build(BuildContext context) {
    return Container(
      color: Color(kBackgroundColor),
      // color: Colors.transparent,
      margin: EdgeInsets.only(top: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(17),
            margin: EdgeInsets.only(right: 1.0),
            child: Icon(
              icon,
              color: kTextColor,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: controller,
              validator: onValidate,
              onSaved: onSaved,
              keyboardType: textInputType,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                labelText: labelText,
                // hintText: labelText,
                labelStyle: TextStyle(fontSize: 14.0),
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                focusColor: Colors.black,
              ),
              obscureText: obsecureText,
            ),
          ),
        ],
      ),
    );
  }
}
