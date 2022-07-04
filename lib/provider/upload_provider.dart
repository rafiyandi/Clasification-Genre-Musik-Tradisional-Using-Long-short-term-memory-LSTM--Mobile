import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:genremusik/model/upload_model.dart';
import 'package:genremusik/services/upload_service.dart';

class UploadProvider extends ChangeNotifier {
  late UploadModel _upload;
  UploadModel get upload => _upload;

  set upload(UploadModel upload) {
    _upload = upload;
    notifyListeners();
  }

  Future<bool> uploadMusik({
    required File file,
  }) async {
    try {
      UploadModel upload = await UploadService().uploadMusics(
        file: file,
      );
      print("yeee berhasil fiii");
      _upload = upload;
      return true;
    } catch (e) {
      print("Data Tidak Ada fi " + e.toString());
      return false;
    }
  }
}
