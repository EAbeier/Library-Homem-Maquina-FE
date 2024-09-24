class GenreReadModel {
  int? id;
  String? name;

  GenreReadModel({this.id, this.name});

  GenreReadModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;

    return data;
  }

  static Map<String, dynamic> toJsonStatic(GenreReadModel model) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = model.id;
    data['name'] = model.name;

    return data;
  }
}
