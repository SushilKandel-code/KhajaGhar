import 'package:flutter/material.dart';

const int kBackgroundColor = 0xffF4F4F4;

const Color kPrimaryColor = Colors.black;
const Color kTextColor = Color(0xff686868);

const TextStyle kBoldTextStyle =
    TextStyle(fontSize: 26.0, fontWeight: FontWeight.w900, letterSpacing: 1.0);

const TextStyle kMediumTextStyle =
    TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700);

const BoxShadow kBoxShadow = BoxShadow(
  color: Color(0x55d3d3d3),
  spreadRadius: 1,
  blurRadius: 5,
  offset: Offset(0, 6), // changes position of shadow
);
