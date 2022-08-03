import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:genremusik/provider/upload_provider.dart';
import 'package:genremusik/shared/theme.dart';
import 'package:genremusik/widgets/appBar/appbar_title.dart';
import 'package:genremusik/widgets/button/button_widget.dart';
import 'package:genremusik/widgets/button/loading_button.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart';

class ClasificationGenre extends StatefulWidget {
  const ClasificationGenre({Key? key}) : super(key: key);

  @override
  _ClasificationGenreState createState() => _ClasificationGenreState();
}

class _ClasificationGenreState extends State<ClasificationGenre> {
  File file = File('');
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    UploadProvider uploadProvider = Provider.of<UploadProvider>(context);

    Future handleUpload() async {
      setState(() {
        isLoading = true;
      });
      if (await uploadProvider.uploadMusik(file: file)) {
        showDialog(
            context: context,
            builder: (context) => uploadProvider.upload.presentase! < 50
                ? AlertDialog(
                    backgroundColor: backgroundColor3,
                    content: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Text(
                          "Musik Tidak Dikenali",
                          style: primaryTextStyle.copyWith(
                              fontSize: 18, fontWeight: semiBold),
                        )),
                  )
                : AlertDialog(
                    backgroundColor: backgroundColor3,
                    content: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              "Klasifikasi Berhasil",
                              style: primaryTextStyle.copyWith(
                                  fontSize: 18, fontWeight: semiBold),
                            ),
                            const SizedBox(height: 30),
                            // Image.asset("assets/icon/icon_success.png", width: 100),
                            CircularPercentIndicator(
                              radius: 70,
                              lineWidth: 15.0,
                              percent:
                                  uploadProvider.upload.presentase!.toDouble() /
                                      100,
                              animation: true,
                              animationDuration: 1000,
                              center: Text(
                                "${uploadProvider.upload.presentase!.toString()} %",
                                style: primaryTextStyle.copyWith(
                                    fontSize: 18, fontWeight: semiBold),
                              ),
                              progressColor: primaryColor,
                              backgroundColor: secondaryTextColor,
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 13,
                                      height: 13,
                                      decoration: BoxDecoration(
                                        color: secondaryTextColor,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Tidak Cocok",
                                      style: primaryTextStyle.copyWith(
                                          fontSize: 12, fontWeight: regular),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 13,
                                      height: 13,
                                      decoration: BoxDecoration(
                                        color: primaryColor,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Cocok",
                                      style: primaryTextStyle.copyWith(
                                          fontSize: 12, fontWeight: regular),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            Text(
                              uploadProvider.upload.genre
                                  .toString()
                                  .toUpperCase(),
                              style: primaryTextStyle.copyWith(
                                  fontSize: 18, fontWeight: semiBold),
                            ),
                            const SizedBox(height: 30),
                            Container(
                              width: 154,
                              height: 44,
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    backgroundColor: primaryColor,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Oke",
                                    style: primaryTextStyle,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Upload Gagal',
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.red,
        ));
      }
      setState(() {
        isLoading = false;
      });
    }

    final fileName = file != null ? basename(file.path) : 'No File Selected';

    return Scaffold(
      backgroundColor: backgroundColor3,
      body: ListView(
        children: [
          appBarTitle("KLasifikasi Genre Musik Tradisional"),
          Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 100),
                Image.asset(
                  "assets/icon/icon_headset.png",
                  width: 100,
                ),
                const SizedBox(height: 100),
                ButtonWidget(
                  text: 'Select File',
                  icon: Icons.attach_file,
                  onClicked: selectFile,
                ),
                const SizedBox(height: 8),
                Text(
                  fileName,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.white),
                ),
                const SizedBox(height: 48),
                isLoading
                    ? const ButtonLoading(icon: Icons.cloud_upload_outlined)
                    : ButtonWidget(
                        text: 'Clasification Music',
                        icon: Icons.cloud_upload_outlined,
                        // onClicked: handleUpload,
                        onClicked: handleUpload,
                      ),
                const SizedBox(height: 20),
              ],
            ),
          )

          // task != null ? buildUploadStatus(task!) : Container(),
        ],
      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }
}
