class HasilModel {
  late int id;
  late String file;
  late String hasil;
  late DateTime createdAt;
  late DateTime updatedAt;

  HasilModel(this.id, this.file, this.hasil, this.createdAt, this.updatedAt);

  HasilModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    file = json['file'];
    hasil = json['hasil'];
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'file': file.toString(),
      'hasil': hasil,
      'created_at': createdAt.toString(),
      'updated_At': updatedAt.toString(),
    };
  }
}
