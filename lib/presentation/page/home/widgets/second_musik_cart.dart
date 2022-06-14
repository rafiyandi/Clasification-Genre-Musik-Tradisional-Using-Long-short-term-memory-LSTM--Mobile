import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:genremusik/model/music_model.dart';
import 'package:genremusik/presentation/page/home/detail_musik_page.dart';
import 'package:genremusik/shared/theme.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
// import 'package:shamo/pages/product_page.dart';

// const SecondMusikCart(this.music, {Key? key}) : super(key: key);

// final MusicModel music;

class SecondMusikCart extends StatelessWidget {
  final MusicModel musik;
  SecondMusikCart(this.controller, this.musik, {Key? key}) : super(key: key);
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailMusicPage(musik),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xffECEDEF),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              // child: Image.asset(
              //   musik.galleries[0].url,
              //   width: double.infinity,
              //   height: 150,
              //   fit: BoxFit.cover,
              //   alignment: Alignment.topCenter,
              // ),
              child: CachedNetworkImage(
                imageUrl: musik.galleries[0].url,
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
            SizedBox(height: 12),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    musik.category.name,
                    overflow: TextOverflow.ellipsis,
                    style: secondaryTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    musik.name,
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    musik.daerah,
                    overflow: TextOverflow.ellipsis,
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: bold,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Container(
//         width: 156,
//         height: 250,
//         margin: EdgeInsets.only(
//           bottom: 17,
//         ),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: const Color(0xffECEDEF),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(15),
//               child: Image.asset(
//                 'assets/image/image_tarian2.png',
//                 width: double.infinity,
//                 height: 150,
//                 fit: BoxFit.cover,
//                 alignment: Alignment.topCenter,
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.symmetric(
//                 horizontal: 7,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 12),
//                   Text(
//                     'Melayu',
//                     overflow: TextOverflow.ellipsis,
//                     style: secondaryTextStyle.copyWith(
//                       fontSize: 12,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 3,
//                   ),
//                   Text(
//                     'Keroncong',
//                     style: blackTextStyle.copyWith(
//                       fontSize: 16,
//                       fontWeight: semiBold,
//                     ),
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 1,
//                   ),
//                   const SizedBox(
//                     height: 6,
//                   ),
//                   Text(
//                     'Jawa Timur',
//                     overflow: TextOverflow.ellipsis,
//                     style: blackTextStyle.copyWith(
//                       fontSize: 14,
//                       fontWeight: bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
