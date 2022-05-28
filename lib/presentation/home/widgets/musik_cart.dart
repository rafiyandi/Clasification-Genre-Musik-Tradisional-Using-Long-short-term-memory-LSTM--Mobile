import 'package:flutter/material.dart';
import 'package:genremusik/shared/theme.dart';
// import 'package:shamo/pages/product_page.dart';

class MusikCart extends StatelessWidget {
  // MusikCart(this.product);
  // final ProductModel product;

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
        width: 215,
        height: 278,
        margin: EdgeInsets.only(
          right: defaultMargin,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xffECEDEF),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            // Image.network(
            //   product.galleries[0].url,
            //   width: 215,
            //   height: 150,
            //   fit: BoxFit.cover,
            // ),

            Image.asset(
              'assets/image/image_tarian2.png',
              width: 215,
              height: 150,
              fit: BoxFit.cover,
            ),
            // CachedNetworkImage(
            //   imageUrl: widget.product.galleries[0].url,
            //   width: 215,
            //   height: 150,
            // ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   product.category.name,
                  //   style: secondaryTextStyle.copyWith(
                  //     fontSize: 12,
                  //   ),
                  // ),
                  Text(
                    'Melayu',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  // Text(
                  //   product.name,
                  //   style: blackTextStyle.copyWith(
                  //     fontSize: 18,
                  //     fontWeight: semiBold,
                  //   ),
                  //   overflow: TextOverflow.ellipsis,
                  //   maxLines: 1,
                  // ),
                  Text(
                    'Keroncong',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Jawa Timur',
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
