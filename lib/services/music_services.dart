import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:genremusik/model/music_model.dart';
import 'package:http/http.dart' as http;

class MusicServices {
  String baseUrl = 'http://10.140.240.51:8000/api';

  Dio dio = Dio();

  Future<List<MusicModel>> getMusics() async {
    var url = '$baseUrl/music';

    // var headers = {'Content-Type': 'aplication/json'};
    // var response = await http.get(Uri.parse(url), headers: headers);
    var response = await dio.get(url,
        options: Options(headers: {
          "Content-Type": "application/json",
        }));
    print(response.data);

    if (response.statusCode == 200) {
      List data = response.data['data']['data'];
      List<MusicModel> musics = [];

      for (var item in data) {
        musics.add(MusicModel.fromJson(item));
      }
      return musics;
    } else {
      throw Exception('Gagal get musik');
    }
  }
}
