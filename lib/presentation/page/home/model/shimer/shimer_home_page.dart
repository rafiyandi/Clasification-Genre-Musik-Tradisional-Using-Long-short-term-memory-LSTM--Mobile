import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimerHomePage extends StatelessWidget {
  const ShimerHomePage.rectangleSLider({
    this.width = double.infinity,
    required this.height,
  }) : this.shapeBorder = const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ));

  const ShimerHomePage.titleText({
    this.width = double.infinity,
    required this.height,
  }) : this.shapeBorder = const RoundedRectangleBorder();

  const ShimerHomePage.contentText({
    this.width = double.infinity,
    required this.height,
    this.shapeBorder = const CircleBorder(),
  });

  const ShimerHomePage.boxContentBottom({
    this.width = double.infinity,
    required this.height,
  }) : this.shapeBorder = const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ));

  final double? width;
  final double? height;
  final ShapeBorder? shapeBorder;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color.fromARGB(255, 46, 43, 61),
      highlightColor: Color.fromARGB(255, 62, 60, 72),
      child: Container(
        width: width,
        height: height,
        decoration:
            ShapeDecoration(shape: shapeBorder!, color: Colors.grey[400]!),
      ),
    );
  }
}
