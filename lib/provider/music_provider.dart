import 'package:flutter/material.dart';
import 'package:genremusik/model/music_model.dart';
import 'package:genremusik/services/music_services.dart';

class MusicProvider with ChangeNotifier {
  List<MusicModel> _musics = [];
  List<MusicModel> get musics => _musics;

  set musics(List<MusicModel> musics) {
    _musics = musics;
    notifyListeners();
  }

  Future<void> getMusics() async {
    try {
      List<MusicModel> musics = await MusicServices().getMusics();
      _musics = musics;
    } catch (e) {
      print(e);
    }
  }
}
