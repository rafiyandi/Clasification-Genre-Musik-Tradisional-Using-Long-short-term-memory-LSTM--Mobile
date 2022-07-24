import 'package:dio/dio.dart';
import 'package:genremusik/model/hasil_model.dart';
import 'package:genremusik/utils/constants.dart' as constants;

class HasilServices {
  // String baseUrl = 'http://192.168.35.80:8000/api';
  // String endpoint = constants.Server_APi;
  String endpoint = "${constants.Server_APi}/hasil";

  Dio dio = Dio();

  Future<List<HasilModel>> getHasil() async {
    var url = endpoint;

    var response = await dio.get(
      url,
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    print(response.data);

    if (response.statusCode == 200) {
      List data = response.data['data'] ?? [];
      // List<HasilModel> hasil =
      //     data.map((hasil) => HasilModel.fromJson(hasil)).toList();
      List<HasilModel> hasil = [];

      for (var item in data) {
        hasil.add(HasilModel.fromJson(item));
      }
      print("Berhasil Get data klasifikasi");
      return hasil;
    } else {
      throw Exception('Gagal get musik');
    }
  }
}
