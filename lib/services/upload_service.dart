import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:genremusik/model/upload_model.dart';

class UploadService {
  String baseUrl = 'http://192.168.159.80:8000/api';

  int? sent;
  int? total;
  Dio dio = Dio();

  Future<UploadModel> uploadMusics({
    required File file,
  }) async {
    String fileName = file.path.split('/').last;
    var progress;

    try {
      var url = '$baseUrl/upload';
      var formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(file.path, filename: fileName),
      });

      var response = await dio.post(
        url,
        options: Options(headers: {
          "Content-Type": "application/json",
        }),
        data: formData,
        // onSendProgress: (sent, total) {
        //   // print("$sent $total");
        //   final progress = (sent / total * 100).toStringAsFixed(0);
        //   print(progress);
        // },
      );
      print(response.data);

      if (response.statusCode == 200) {
        var data = response.data;
        // Map<String, dynamic> userdata =
        //   new Map<String, dynamic>.from(jsonDecode(response.data));
        UploadModel uploadModel =
            UploadModel.fromJson(data['data'] as Map<String, dynamic>);
        uploadModel.genre;
        print('berhasil upload');
        return uploadModel;
      } else {
        throw Exception('Gagal upload');
      }
    } on DioError catch (e) {
      print(e.response!.data);
      throw Exception('Gagal upload');
    }
  }
}
