import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:genremusik/shared/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailMusicPage extends StatefulWidget {
  const DetailMusicPage({Key? key}) : super(key: key);

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

    Widget textTitleContent(String title, String content) {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: primaryTextStyle.copyWith(fontWeight: medium),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              content,
              style: subtitleTextStyle.copyWith(fontWeight: semiBold),
              textAlign: TextAlign.justify,
            )
          ],
        ),
      );
    }

    Widget buildIndicator() {
      return AnimatedSmoothIndicator(
          activeIndex: currentIndex,
          count: images.length,
          effect: ExpandingDotsEffect(
              dotWidth: 7,
              dotHeight: 7,
              expansionFactor: 3,
              activeDotColor: primaryColor,
              dotColor: const Color(0xffc4c4c4)));
    }

    Widget buildImage(String urlImage, int index) {
      return Image.asset(
        urlImage,
        fit: BoxFit.cover,
      );
    }

    Widget content() {
      // int index = -1;
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 17),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(
              top: const Radius.circular(24),
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
                ],
              ),
            ),
            textTitleContent("Pencipta", "Sudirman"),
            textTitleContent("Penyanyi", "Supratman"),
            textTitleContent("Tarian Tradisional", "Rara"),
            textTitleContent("DescripTion",
                "Musik Keroncong (atau Kroncong) adalah jenis musik khas Indonesia yang sangat populer. Musik Keroncong adalah sebuah musik khas dari turunan dan kontemporesasi dari musik-musik budaya luar yang akhirnya dimodifikasi berkembang pesat di Indonesia. Hingga akhirnya Musik Keroncong dideskripsikan sebagai jenis musik hasil perpaduan Budaya Barat dan Budaya Timur."),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      );
    }

    Widget header() {
      // int index = -1;
      return Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider.builder(
                options: CarouselOptions(
                  height: 400,
                  viewportFraction: 1,
                  // enlargeCenterPage: true,
                  autoPlay: true,
                  // enlargeStrategy: CenterPageEnlargeStrategy.height,
                  enableInfiniteScroll: true,
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
            ],
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new),
            color: blackColor,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 289, bottom: 17),
                child: buildIndicator(),
              ),
              content(),
            ],
          ),
          const SizedBox(
            height: 306,
          ),
        ],
      );
    }

    Widget secondHeadr() {
      return Container(
        width: double.infinity,
        height: 375,
        decoration: const BoxDecoration(
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
