import 'package:flutter/material.dart';
import 'package:genremusik/presentation/home/widgets/musik_cart.dart';
import 'package:genremusik/presentation/home/widgets/musik_tile.dart';
import 'package:genremusik/shared/theme.dart';
import 'package:genremusik/widgets/appBar/appbar_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  @override
  Widget build(BuildContext context) {
    // AuthProvider authProvider = Provider.of<AuthProvider>(context);
    // UserModel user = authProvider.user;
    // ProductProvider productProvider = Provider.of<ProductProvider>(context);

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
                // children: productProvider.products
                //         .map(
                //           (product) => ProductCard(product),
                //         )
                //         .toList() ??
                //     [],
                children: const [
                  MusikCart(),
                  MusikCart(),
                  MusikCart(),
                  MusikCart(),
                ],
              ),
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
          'New Arrivals',
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
          // children: productProvider.products
          //     .map(
          //       (product) => MusikTile(product),
          //     )
          //     .toList(),
          children: const [
            MusikTile(),
            MusikTile(),
            MusikTile(),
            MusikTile(),
            MusikTile(),
          ],
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
