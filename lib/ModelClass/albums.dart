// To parse this JSON data, do
//
//     final album = albumFromJson(jsonString);

import 'dart:convert';

Album albumFromJson(String str) => Album.fromJson(json.decode(str));

String albumToJson(Album data) => json.encode(data.toJson());

class Album {
  Album({
    this.name,
    this.email,
    this.phone,
    this.confirmPassword,
    this.password,
  });

  String name;
  String email;
  String phone;
  String confirmPassword;
  String password;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        confirmPassword: json["confirm_password"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "confirm_password": confirmPassword,
        "password": password,
      };
}
