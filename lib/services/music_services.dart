import 'dart:convert';

import 'package:genremusik/model/music_model.dart';
import 'package:http/http.dart' as http;

class MusicServices {
  String baseUrl = 'http://localhost:8000/api';

  Future<List<MusicModel>> getMusics() async {
    var url = '$baseUrl/music';

    var headers = {'Content-Type': 'aplication/json'};

    var response = await http.get(Uri.parse(url), headers: headers);

    print(response.body);

    if (response.statusCode == 20) {
      List data = jsonDecode(response.body)['data']['data'];
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