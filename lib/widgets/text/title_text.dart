import 'package:flutter/widgets.dart';
import 'package:genremusik/shared/theme.dart';

Widget titleText(String text) {
  return Text(
    text,
    style: whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
  );
}
