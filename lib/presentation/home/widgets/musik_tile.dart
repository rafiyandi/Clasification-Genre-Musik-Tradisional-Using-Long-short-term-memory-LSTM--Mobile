import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:genremusik/shared/theme.dart';

class MusikTile extends StatelessWidget {
  // final ProductModel product;
  // MusikTile(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => ProductPage(product),
        //   ),
        // );
      },
      child: Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          bottom: defaultMargin,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ClipRRect(
            //     borderRadius: BorderRadius.circular(20),
            //     child: Image.network(
            //       product.galleries[0].url,
            //       width: 120,
            //       height: 120,
            //       fit: BoxFit.cover,
            //     )),
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/image/image_tarian2.png',
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              width: 12,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Melayu",
                    style: secondaryTextStyle.copyWith(
                        fontSize: 12, fontWeight: regular)),
                SizedBox(
                  height: 6,
                ),
                Text(
                  "Keroncong",
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  "Jawa",
                  style: primaryTextStyle.copyWith(
                      fontSize: 14, fontWeight: medium),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
