import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:genremusik/presentation/page/home/model/musik_cart.dart';
import 'package:genremusik/presentation/page/home/model/shimer/shimer_home_page.dart';
import 'package:genremusik/provider/music_provider.dart';
import 'package:genremusik/shared/theme.dart';
import 'package:genremusik/widgets/appBar/appbar_title.dart';
import 'package:genremusik/widgets/text/title_text.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController controller = ScrollController();

  int currentIndex = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      // Future.delayed(const Duration(), () {
      getMusik();
    });
    // });
  }

  Future<void> getMusik() async {
    setState(() {
      isLoading = true;
    });
    await Provider.of<MusicProvider>(context, listen: false).getMusics();
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
          const ShimerHomePage.rectangleSLider(
            height: 200,
          ),
          const SizedBox(height: 26),
          Center(
            child: ShimerHomePage.titleText(
              width: MediaQuery.of(context).size.width * 0.6,
              height: 24,
            ),
          ),
          const SizedBox(height: 39),
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
          const SizedBox(height: 40),
          ShimerHomePage.contentText(
              width: MediaQuery.of(context).size.width * 0.40,
              height: 16.7,
              shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3))),
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
                itemBuilder: (context, index, realIndex) {
                  final urlImage = musicProvider.musics[0].galleries[index].url;
                  // print("ini index " + urlImage.toString());

                  return buildImage(urlImage);
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
        margin: const EdgeInsets.only(top: 39),
        child: Text(
          musicProvider.musics[0].description,
          style: whiteTextStyle.copyWith(
            fontSize: 12,
          ),
          textAlign: TextAlign.justify,
        ),
      );
    }

    Widget buildBody(BuildContext context) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 37),
            header(),
            const SizedBox(height: 26),
            Center(child: titleText(musicProvider.musics[0].name)),
            content(),
            const SizedBox(height: 49),
            titleText("Lainnya"),
            const SizedBox(height: 28),
            // SecondMusikCart(controller, musicProvider.musics),
            StaggeredGridView.countBuilder(
              controller: controller,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              staggeredTileBuilder: (integer) =>
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? const StaggeredTile.count(2, 3)
                      : const StaggeredTile.count(2, 1.4),
              // staggeredTileBuilder: (index) => StaggeredTile.fit(2),
              crossAxisCount: 4,
              itemCount: musicProvider.musics.length,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              itemBuilder: (context, index) {
                return MusikCart(controller, musicProvider.musics[index]);
              },
            )
          ],
        ),
      );
    }

    return isLoading
        ? buildShimerHomePage()
        : ListView(
            controller: controller,
            children: [
              appBarTitle("Musik Tradisional"),
              buildBody(context),
            ],
          );
  }
}
