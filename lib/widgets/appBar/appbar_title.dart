import 'package:flutter/material.dart';
import 'package:genremusik/shared/theme.dart';

Widget appBarTitle(String text) {
  return AppBar(
    title: Text(
      text,
      style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
    ),
    centerTitle: true,
    backgroundColor: backgroundColor1,
    automaticallyImplyLeading: false,
    elevation: 2,
  );
}
