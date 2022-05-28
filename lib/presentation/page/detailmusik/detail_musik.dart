import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:genremusik/shared/theme.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailMusicPage extends StatefulWidget {
  @override
  _DetailMusicPageState createState() => _DetailMusicPageState();
  // final ProductModel product;
  // DetailMusicPage(this.product);
}

class _DetailMusicPageState extends State<DetailMusicPage> {
  final images = [
    "assets/image/image_tarian1.jpg",
    "assets/image/image_tarian2.png",
    "assets/image/image_tarian3.png",
    "assets/image/image_tarian4.jpg",
  ];

  // List familiarShoes = [
  //   "assets/image_shoes1.png",
  //   "assets/image_shoes2.png",
  //   "assets/image_shoes3.png",
  //   "assets/image_shoes4.png",
  //   "assets/image_shoes5.png",
  //   "assets/image_shoes6.png",
  //   "assets/image_shoes7.png",
  // ];

  int currentIndex = 0;
  // bool isWishlist = false;

  @override
  Widget build(BuildContext context) {
    // WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    // CartProvider cartProvider = Provider.of<CartProvider>(context);

    // Widget indicator(int index) {
    //   return Container(
    //     width: currentIndex == index ? 16 : 4,
    //     height: 4,
    //     margin: EdgeInsets.symmetric(horizontal: 2),
    //     decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(10),
    //         color: currentIndex == index ? primaryColor : Color(0xffc4c4c4)),
    //   );
    // }

// Widget indicator(){
//   return AnimatedSmoothIndicator(activeIndex: activeIndex, count: count)
// }

    Widget buildImage(String urlImage, int index) {
      return Container(
        color: primaryColor,
        child: Image.asset(
          urlImage,
          fit: BoxFit.cover,
        ),
      );
    }

    Widget familiarShoesCard(String imageUrl) {
      return Container(
        width: 54,
        height: 54,
        margin: EdgeInsets.only(
          right: 16,
        ),
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(imageUrl)),
            borderRadius: BorderRadius.circular(6)),
      );
    }

    Widget header() {
      int index = -1;
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              height: 400,
              viewportFraction: 1,
              initialPage: 0,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
            itemCount: images.length,
            itemBuilder: (context, index, realIndex) {
              final urlImage = images[index];
              return buildImage(urlImage, index);
            },
          ),
          SizedBox(
            height: 20,
          ),
          // Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: images.map((e) {
          //       index++;
          //       return indicator(index);
          //     }).toList())
        ],
      );
    }

    Widget content() {
      int index = -1;
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 17),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24),
            ),
            color: backgroundColor1),

        //
        child: Column(
          // NOTE : HEADER
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: defaultMargin,
                  right: defaultMargin,
                  left: defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Keroncong",
                          style: primaryTextStyle.copyWith(
                              fontSize: 18, fontWeight: semiBold),
                        ),
                        Text(
                          "Melayu",
                          style: secondaryTextStyle.copyWith(fontSize: 12),
                        )
                      ],
                    ),
                  ),

                  // GestureDetector(
                  //   onTap: () {
                  //     // setState(() {
                  //     //   isWishlist = !isWishlist;
                  //     // });
                  //     // wishlistProvider.setProduct(widget.product);

                  //     if (wishlistProvider.isWishlist(widget.product)) {
                  //       ScaffoldMessenger.of(context).showSnackBar(
                  //         SnackBar(
                  //           backgroundColor: secondaryColor,
                  //           content: Text(
                  //             'Has been added to the Wishlist',
                  //             textAlign: TextAlign.center,
                  //           ),
                  //         ),
                  //       );
                  //     } else {
                  //       ScaffoldMessenger.of(context).showSnackBar(
                  //         SnackBar(
                  //           backgroundColor: alertColor,
                  //           content: Text(
                  //             'Has been removed from the Wishlist',
                  //             textAlign: TextAlign.center,
                  //           ),
                  //         ),
                  //       );
                  //     }
                  //   },
                  //   child: Image.asset(
                  //     wishlistProvider.isWishlist(widget.product)

                  //         // isWishlist
                  //         ? 'assets/button_wishlist_blue.png'
                  //         : 'assets/button_wishlist.png',
                  //     width: 46,
                  //   ),
                  // ),
                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: backgroundColor2,
                  borderRadius: BorderRadius.circular(4)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Price starts from",
                    style: primaryTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text("\$${70}",
                      style: priceTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: defaultMargin,
                  right: defaultMargin,
                  left: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: primaryTextStyle.copyWith(fontWeight: medium),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "widget.product.description",
                    style: subtitleTextStyle.copyWith(fontWeight: semiBold),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),
            // Container(
            //   width: double.infinity,
            //   margin: EdgeInsets.only(top: defaultMargin),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Padding(
            //         padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            //         child: Text(
            //           "Fimiliar Shoes",
            //           style: primaryTextStyle.copyWith(fontWeight: medium),
            //         ),
            //       ),
            //       SizedBox(
            //         height: 12,
            //       ),
            //       SingleChildScrollView(
            //         scrollDirection: Axis.horizontal,
            //         child: Row(
            //           children: familiarShoes.map((image) {
            //             index++;
            //             return Container(
            //               margin: EdgeInsets.only(
            //                   left: index == 0 ? defaultMargin : 0),
            //               child: familiarShoesCard(image),
            //             );
            //           }).toList(),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            //NOTE:BUTTON
            // Container(
            //   margin: EdgeInsets.all(defaultMargin),
            //   width: double.infinity,
            //   child: Row(
            //     children: [
            //       Container(
            //         height: 54,
            //         width: 54,
            //         decoration: BoxDecoration(
            //           image: DecorationImage(
            //               image: AssetImage("assets/button_chat.png")),
            //         ),
            //       ),
            //       SizedBox(
            //         width: 16,
            //       ),
            //       Expanded(
            //         child: Container(
            //             height: 54,
            //             child: TextButton(
            //               onPressed: () {
            //                 // cartProvider.addCart(widget.product);
            //                 showSuccessDialog();
            //               },
            //               style: TextButton.styleFrom(
            //                   backgroundColor: primaryColor,
            //                   shape: RoundedRectangleBorder(
            //                       borderRadius: BorderRadius.circular(12))),
            //               child: Text(
            //                 "Add to Cart",
            //                 style: primaryTextStyle.copyWith(
            //                     fontSize: 16, fontWeight: semiBold),
            //               ),
            //             )),
            //       )
            //     ],
            //   ),
            // )
          ],
        ),
      );
    }

    Widget secondHeadr() {
      return Container(
        width: double.infinity,
        height: 375,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/image/image_tarian2.png',
              ),
              fit: BoxFit.cover),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor6,
      body: ListView(
        children: [
          // secondHeadr()
          header(),
          // content(),
        ],
      ),
    );
  }
}
