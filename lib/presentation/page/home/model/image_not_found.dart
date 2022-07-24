import 'package:flutter/material.dart';

Widget imageNotFound(double height) {
  return SizedBox(
    width: double.infinity,
    height: height,
    child: Image.asset(
      "assets/image/image_not_found.png",
      fit: BoxFit.cover,
    ),
  );
}
