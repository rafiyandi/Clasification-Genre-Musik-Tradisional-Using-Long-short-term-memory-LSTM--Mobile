import 'package:flutter/material.dart';
import 'package:genremusik/presentation/page/home/detail_musik.dart';
import 'package:genremusik/shared/theme.dart';
// import 'package:shamo/pages/product_page.dart';

class MusikCart extends StatelessWidget {
  const MusikCart({Key? key}) : super(key: key);

  // MusikCart(this.product);
  // final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DetailMusicPage(),
          ),
        );
      },
      child: Container(
        width: 215,
        height: 278,
        margin: EdgeInsets.only(
          right: defaultMargin,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xffECEDEF),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image.network(
            //   product.galleries[0].url,
            //   width: 215,
            //   height: 150,
            //   fit: BoxFit.cover,
            // ),

            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/image/image_tarian2.png',
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
            // CachedNetworkImage(
            //   imageUrl: widget.product.galleries[0].url,
            //   width: 215,
            //   height: 150,
            // ),
            Container(
              margin: const EdgeInsets.symmetric(
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
                  const SizedBox(
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
                  const SizedBox(
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
  }
}
