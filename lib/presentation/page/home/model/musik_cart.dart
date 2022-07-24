import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:genremusik/model/music_model.dart';
import 'package:genremusik/presentation/page/home/detail_musik_page.dart';
import 'package:genremusik/presentation/page/home/model/image_not_found.dart';
import 'package:genremusik/shared/theme.dart';

class MusikCart extends StatelessWidget {
  final MusicModel musik;
  MusikCart(this.controller, this.musik, {Key? key}) : super(key: key);
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
          color: const Color(0xffECEDEF),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: musik.galleries.isEmpty
                  ? imageNotFound(150)
                  : CachedNetworkImage(
                      imageUrl: musik.galleries[0].url,
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
            ),
            const SizedBox(height: 12),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
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
