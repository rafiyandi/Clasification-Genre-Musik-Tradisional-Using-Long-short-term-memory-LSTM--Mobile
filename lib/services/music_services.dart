import 'package:dio/dio.dart';
import 'package:genremusik/model/music_model.dart';

class MusicServices {
  String baseUrl = 'http://192.168.159.80:8000/api';

  Dio dio = Dio();

  Future<List<MusicModel>> getMusics() async {
    var url = '$baseUrl/music';

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
