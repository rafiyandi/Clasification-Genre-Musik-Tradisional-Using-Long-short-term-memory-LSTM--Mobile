import 'package:flutter/material.dart';
import 'package:genremusik/presentation/page/clasifikasi/clasificasi_genre.dart';
import 'package:genremusik/presentation/page/home/detail_musik_page.dart';
import 'package:genremusik/presentation/page/mainpage/main_page.dart';
import 'package:genremusik/presentation/page/splash/splash_page.dart';
import 'package:genremusik/provider/music_provider.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MusicProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          // '/sign-in': (context) => SplashPage(),
          '/home': (context) => const MainPage(),
          '/genre': (context) => const ClasifikasiGenre(),
        },
      ),
    );
  }
}
