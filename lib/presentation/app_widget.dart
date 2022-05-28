import 'package:flutter/material.dart';
import 'package:genremusik/presentation/home/clasificasi_genre.dart';
import 'package:genremusik/presentation/home/main_page.dart';
import 'package:genremusik/presentation/page/detailmusik/detail_musik.dart';
import 'package:genremusik/presentation/page/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const SplashPage(),
        // '/sign-in': (context) => SplashPage(),
        '/home': (context) => const MainPage(),
        '/genre': (context) => const ClasifikasiGenre(),
        '/detail-musik': (context) => DetailMusicPage(),
      },
    );
  }
}
