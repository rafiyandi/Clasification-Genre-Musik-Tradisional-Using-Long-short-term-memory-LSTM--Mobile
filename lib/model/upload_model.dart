import 'dart:io';

class UploadModel {
  int? id;
  File? file;

  UploadModel(this.file, this.id);

  UploadModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    file = json['file'] != null ? File(json['file']) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'file': file,
    };
  }
}
