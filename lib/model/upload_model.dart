import 'dart:io';

class UploadModel {
  int? id;
  File? file;
  String? genre;
  int? presentase;

  UploadModel(this.file, this.id, this.genre, this.presentase);

  UploadModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    file = json['file'] != null ? File(json['file']) : null;
    genre = json['genre'] != null ? "${json['genre']}" : "TIdak Kedeteksi";
    presentase = json['presentase'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'file': file,
      'genre': genre,
      'presentase': presentase,
    };
  }
}
