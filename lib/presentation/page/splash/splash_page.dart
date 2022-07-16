import 'dart:async';

import 'package:flutter/material.dart';
import 'package:genremusik/provider/music_provider.dart';
import 'package:genremusik/services/music_services.dart';
import 'package:genremusik/shared/theme.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  MusicServices musicServices = MusicServices();
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
    // Future.delayed(const Duration(seconds: 3), () {
    getInit();
    // });
    // });
  }

  getInit() async {
    await Provider.of<MusicProvider>(context, listen: false).getMusics();
    Navigator.pushNamed(context, '/home');
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
