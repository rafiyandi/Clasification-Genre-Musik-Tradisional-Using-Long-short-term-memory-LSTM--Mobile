import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:genremusik/provider/upload_provider.dart';
import 'package:genremusik/widgets/appBar/appbar_title.dart';
import 'package:genremusik/widgets/button/button_widget.dart';
import 'package:genremusik/widgets/button/loading_button.dart';
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

    handleUpload() async {
      setState(() {
        isLoading = true;
      });
      if (await uploadProvider.uploadMusik(file: file)) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Upload Berhasil',
            textAlign: TextAlign.center,
          ),
          backgroundColor: const Color(0xff6C5ECF),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: const Text(
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

    return ListView(
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
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 48),
              isLoading
                  ? const ButtonLoading(icon: Icons.cloud_upload_outlined)
                  : ButtonWidget(
                      text: 'Upload File',
                      icon: Icons.cloud_upload_outlined,
                      onClicked: handleUpload,
                    ),
              const SizedBox(height: 20),
            ],
          ),
        )

        // task != null ? buildUploadStatus(task!) : Container(),
      ],
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }
}
