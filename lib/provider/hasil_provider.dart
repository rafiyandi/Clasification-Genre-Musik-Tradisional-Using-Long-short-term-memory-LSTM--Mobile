import 'package:flutter/material.dart';
import 'package:genremusik/model/hasil_model.dart';
import 'package:genremusik/services/hasil_services.dart';
import 'package:genremusik/services/music_services.dart';

class HasilProvider with ChangeNotifier {
  List<HasilModel> _hasil = [];
  List<HasilModel> get hasil => _hasil;

  set hasil(List<HasilModel> hasil) {
    _hasil = hasil;
    notifyListeners();
  }

  Future<void> gethasil() async {
    try {
      List<HasilModel> hasil = await HasilServices().getHasil();
      _hasil = hasil;
    } catch (e) {
      print(e);
    }
  }
}
