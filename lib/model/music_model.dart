import 'package:genremusik/model/category_model.dart';
import 'package:genremusik/model/gallery_model.dart';

class MusicModel {
  late int id;
  late String name;
  late String daerah;
  late String alatMusik;
  late String penyanyi;
  late String description;
  late CategoryModel category;
  late List<GalleryModel> galleries;
  late DateTime updatedAt;
  late DateTime createdAt;

  MusicModel(
      this.id,
      this.name,
      this.daerah,
      this.alatMusik,
      this.penyanyi,
      this.description,
      this.category,
      this.galleries,
      this.createdAt,
      this.updatedAt);

  MusicModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    daerah = json['daerah'];
    alatMusik = json['alat_musik'];
    penyanyi = json['penyanyi'];
    description = json['description'];
    category = CategoryModel.fromJson(json['category']);
    galleries = json['galleries']
        .map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery))
        .toList();
    updatedAt = DateTime.parse(json['updated_at']);
    createdAt = DateTime.parse(json['created_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'daerah': daerah,
      'alat_musik': alatMusik,
      'penyanyi': penyanyi,
      'description': description,
      'category': category,
      'galleries': galleries.map((gallery) => gallery.toJson()).toList(),
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
    };
  }
}
