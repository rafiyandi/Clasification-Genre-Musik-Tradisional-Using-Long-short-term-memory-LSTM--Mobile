import 'package:flutter/material.dart';
import 'package:genremusik/presentation/home/main_page.dart';
import 'package:genremusik/presentation/page/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => SplashPage(),
        // '/sign-in': (context) => SplashPage(),
        'home': (context) => MainPage(),
      },
    );
  }
}
