import 'dart:io';

class UploadModel {
  int? id;
  File? file;
  String? genre;

  UploadModel(this.file, this.id, this.genre);

  UploadModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    file = json['file'] != null ? File(json['file']) : null;
    genre = json['genre'] != null ? "${json['genre']}" : "TIdak Kedeteksi";
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'file': file,
      'genre': genre,
    };
  }
}
