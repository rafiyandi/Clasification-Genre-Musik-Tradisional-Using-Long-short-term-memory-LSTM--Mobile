import 'package:flutter/material.dart';
import 'package:genremusik/shared/theme.dart';

class ClasifikasiGenre extends StatelessWidget {
  const ClasifikasiGenre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget uploadButton() {
      return Container(
          width: 157,
          height: 44,
          child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
            onPressed: () {},
            child: Text(
              "Upload Musik",
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
          ));
    }

    return Scaffold(
        backgroundColor: backgroundColor3,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icon/icon_headset.png",
                width: 80,
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                "Klasifikasi Genre Musik Tradisional",
                style:
                    primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              SizedBox(
                height: 38,
              ),
              uploadButton(),
            ],
          ),
        ));
  }
}
