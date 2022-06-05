import 'package:flutter/material.dart';
import 'package:genremusik/presentation/page/home/widgets/musik_cart.dart';
import 'package:genremusik/presentation/page/home/widgets/musik_tile.dart';
import 'package:genremusik/provider/music_provider.dart';
import 'package:genremusik/shared/theme.dart';
import 'package:genremusik/widgets/appBar/appbar_title.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  @override
  Widget build(BuildContext context) {
    // ProductProvider productProvider = Provider.of<ProductProvider>(context);

    MusicProvider musicProvider = Provider.of<MusicProvider>(context);

    Widget musikTradisionalTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Musik Tradisional',
          style: primaryTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget musikTradisional() {
      return Container(
        margin: const EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Row(
                  children: musicProvider.musics
                      .map((music) => MusikCart(music))
                      .toList()),
            ],
          ),
        ),
      );
    }

    Widget lainnyaTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Lainnya',
          style: primaryTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget lainnya() {
      return Container(
        margin: const EdgeInsets.only(
          top: 14,
        ),
        child: Column(
          children:
              musicProvider.musics.map((music) => MusikTile(music)).toList(),
        ),
      );
    }

    return ListView(
      children: [
        appBarTitle("Musik Tradisional"),
        musikTradisionalTitle(),
        musikTradisional(),
        lainnyaTitle(),
        lainnya(),
      ],
    );
  }
}
