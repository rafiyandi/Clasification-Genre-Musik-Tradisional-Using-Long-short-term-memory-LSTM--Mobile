import 'package:genremusik/model/category_model.dart';
import 'package:genremusik/model/gallery_model.dart';

class MusicModel {
  late int id;
  late String name;
  late String pencipta;
  late String penyanyi;
  late String tarian;
  late String description;
  late CategoryModel category;
  late List<GalleryModel> galleries;
  late DateTime updatedAt;
  late DateTime createdAt;

  MusicModel(
      this.id,
      this.name,
      this.pencipta,
      this.penyanyi,
      this.description,
      this.category,
      this.galleries,
      this.tarian,
      this.createdAt,
      this.updatedAt);

  MusicModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    pencipta = json['pencipta'];
    penyanyi = json['penyanyi'];
    tarian = json['tarian'];
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
      'pencipta': pencipta,
      'penyanyi': penyanyi,
      'description': description,
      'category': category,
      'galleries': galleries.map((gallery) => gallery.toJson()).toList(),
      'tarian': tarian,
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
    };
  }
}
