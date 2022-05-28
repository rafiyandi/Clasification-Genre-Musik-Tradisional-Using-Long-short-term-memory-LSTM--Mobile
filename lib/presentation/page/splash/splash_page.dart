import 'dart:async';

import 'package:flutter/material.dart';
import 'package:genremusik/shared/theme.dart';
// import 'package:provider/provider.dart';
// import 'package:shamo/providers/product_provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3),
        () => Navigator.pushNamed(context, '/home'));

    // getInit();

    super.initState();
  }

  // getInit() async {
  //   await Provider.of<ProductProvider>(context, listen: false).getProducts();
  //   Navigator.pushNamed(context, '/sign-in');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Container(
          width: 110,
          height: 130,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/icon/icon_headset.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
