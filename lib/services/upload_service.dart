// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:genremusik/model/upload_model.dart';

// class UploadServices {
//   String baseUrl = 'http://127.0.0.1:8000/api/';
//   var header = {
//     "Content-Type": "application/json",
//   };

//   Dio dio = Dio();

//   Future<UploadModel> uploadMusics({
//     File? file,
//   }) async {
//     try {
//       var url = '$baseUrl/upload';

//       var response = await dio.post(url,
//           options: Options(headers: {
//             "Content-Type": "application/json",
//           }),
//           data: {
//             'file': file,
//           });
//       print(response.data);

//       if (response.statusCode == 200) {
//         var data = response.data['data'];
//         print('berhasil upload');
//         return data;
//       } else {
//         throw Exception('Gagal upload');
//       }
//     } on DioError catch (e) {
//       print(e.response!.data);
//       throw Exception('Gagal upload');
//     }
//   }
// }
