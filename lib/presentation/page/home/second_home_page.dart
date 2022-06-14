import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// import 'package:genremusik/presentation/page/home/widgets/musik_tile.dart';
import 'package:genremusik/presentation/page/home/widgets/second_musik_cart.dart';
import 'package:genremusik/presentation/page/home/widgets/shimer/shimer_home_page.dart';
import 'package:genremusik/provider/music_provider.dart';
import 'package:genremusik/shared/theme.dart';
import 'package:genremusik/widgets/appBar/appbar_title.dart';
import 'package:genremusik/widgets/text/title_text.dart';
import 'package:provider/provider.dart';
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
  bool isLoading = true;

  @override
  void initState() {
    getMusik();
    super.initState();
  }

  Future<void> getMusik() async {
    // await Provider.of<MusicProvider>(context, listen: false).getMusics();
    MusicProvider musicProvider = Provider.of(context, listen: false);
    await musicProvider.getMusics();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    MusicProvider musicProvider = Provider.of<MusicProvider>(context);

    Widget buildShimerHomePage() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimerHomePage.rectangleSLider(
            height: 200,
          ),
          SizedBox(height: 26),
          Center(
            child: ShimerHomePage.titleText(
              width: MediaQuery.of(context).size.width * 0.6,
              height: 24,
            ),
          ),
          SizedBox(height: 39),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(top: 5),
              child: ShimerHomePage.contentText(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: 16.7,
                  shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3))),
            ),
          ),
          SizedBox(height: 40),
          ShimerHomePage.contentText(
              width: MediaQuery.of(context).size.width * 0.40,
              height: 16.7,
              shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3))),
          // SizedBox(height: 30),
          // ShimerHomePage.boxContentBottom(height: 150),
        ],
      );
    }

    Widget buildIndicator() {
      return AnimatedSmoothIndicator(
          activeIndex: currentIndex,
          // count: musicProvider.musics[0].galleries.isEmpty
          // ? images.length
          count: musicProvider.musics[0].galleries.length,
          effect: ExpandingDotsEffect(
              dotWidth: 7,
              dotHeight: 7,
              expansionFactor: 3,
              activeDotColor: primaryColor,
              dotColor: const Color(0xffc4c4c4)));
    }

    Widget buildImage(String urlImage) {
      return CachedNetworkImage(
        imageUrl: urlImage,
        width: double.infinity,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      );
    }

    Widget buildImageNotFound(
      String urlImage,
    ) {
      return Image.asset(
        urlImage,
        fit: BoxFit.cover,
      );
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
                itemCount: musicProvider.musics[0].galleries.length,
                // ? images.length
                // : musicProvider.musics[0].galleries.length,
                itemBuilder: (context, index, realIndex) {
                  final urlImage = musicProvider.musics[0].galleries[index].url;
                  // final imageFound = images[index];
                  // print(index.toString() + " = " + realIndex.toString());
                  // print("ini index " + urlImage.toString());

                  return isLoading
                      ? buildShimerHomePage()
                      : buildImage(urlImage);
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
          musicProvider.musics[0].description,
          style: whiteTextStyle.copyWith(
            fontSize: 12,
          ),
          textAlign: TextAlign.justify,
        ),
      );
    }

    return ListView(
      controller: controller,
      children: [
        appBarTitle("Musik Tradisional"),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              buildShimerHomePage(),
            ],
          ),
        )
      ],
    );

    // return ListView(
    //   controller: controller,
    //   children: [
    //     appBarTitle("Musik Tradisional"),
    //     Container(
    //       margin: EdgeInsets.symmetric(horizontal: 20),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           SizedBox(height: 37),
    //           header(),
    //           SizedBox(height: 26),
    //           Center(child: titleText(musicProvider.musics[0].name)),
    //           content(),
    //           SizedBox(height: 49),
    //           titleText("Lainnya"),
    //           SizedBox(height: 28),
    //           SecondMusikCart(controller, musicProvider.musics),

    //           // Column(
    //           //   children: musicProvider.musics
    //           //       .map(
    //           //         (music) => SecondMusikCart(controller, music),
    //           //       )
    //           //       .toList(),
    //           // )
    //         ],
    //       ),
    //     )
    //   ],
    // );
  }
}
