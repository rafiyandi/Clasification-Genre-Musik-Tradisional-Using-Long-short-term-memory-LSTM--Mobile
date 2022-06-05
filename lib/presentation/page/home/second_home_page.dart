import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:genremusik/presentation/page/home/widgets/musik_tile.dart';
import 'package:genremusik/presentation/page/home/widgets/second_musik_cart.dart';
import 'package:genremusik/shared/theme.dart';
import 'package:genremusik/widgets/appBar/appbar_title.dart';
import 'package:genremusik/widgets/text/title_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SecondHomePage extends StatefulWidget {
  const SecondHomePage({Key? key}) : super(key: key);

  @override
  State<SecondHomePage> createState() => _SecondHomePageState();
}

class _SecondHomePageState extends State<SecondHomePage> {
  ScrollController controller = ScrollController();
  final images = [
    "assets/image/image_tarian1.jpg",
    "assets/image/image_tarian2.png",
    "assets/image/image_tarian3.png",
    "assets/image/image_tarian4.jpg",
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
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
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: AssetImage(urlImage),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter),
        ),
      );

      // Image.asset(
      //   urlImage,
      //   fit: BoxFit.cover,
      // );
    }

    Widget header() {
      // int index = -1;
      return Stack(
        children: [
          Column(
            children: [
              CarouselSlider.builder(
                options: CarouselOptions(
                  height: 200,
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
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 170, bottom: 17),
              child: buildIndicator(),
            ),
          ),
        ],
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.only(top: 39),
        child: Text(
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ',
          style: whiteTextStyle.copyWith(
            fontSize: 12,
          ),
          textAlign: TextAlign.justify,
        ),
      );
    }

    return ListView(
      // shrinkWrap: true,
      controller: controller,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 37),
              header(),
              SizedBox(height: 26),
              Center(child: titleText("Ranup Lampuan")),
              content(),
              SizedBox(height: 49),
              titleText("Lainnya"),
              SizedBox(height: 28),
              scecondMusikCart(context, controller)
            ],
          ),
        )
      ],
    );
    // Container(
    //     margin: EdgeInsets.symmetric(horizontal: 20),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         SizedBox(height: 37),
    //         header(),
    //         SizedBox(height: 26),
    //         titleText("Ranup Lampuan"),
    //         content(),
    //         SizedBox(height: 49),
    //         titleText("Lainnya"),
    //         SizedBox(height: 28),
    //         SecondMusikCart(),
    //       ],
    //     )),
  }
}
