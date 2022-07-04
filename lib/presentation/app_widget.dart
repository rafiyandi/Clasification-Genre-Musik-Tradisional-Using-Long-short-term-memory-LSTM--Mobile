import 'package:flutter/material.dart';
import 'package:genremusik/presentation/page/clasifikasi/clasification_genre.dart';
import 'package:genremusik/presentation/page/mainpage/main_page.dart';
import 'package:genremusik/presentation/page/splash/splash_page.dart';
import 'package:genremusik/provider/music_provider.dart';
import 'package:genremusik/provider/upload_provider.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MusicProvider()),
        ChangeNotifierProvider(create: (context) => UploadProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          // '/sign-in': (context) => SplashPage(),
          '/home': (context) => const MainPage(),
          '/genre': (context) => const ClasificationGenre(),
        },
      ),
    );
  }
}
