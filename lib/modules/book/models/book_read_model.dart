import 'package:homem_maquina_library/modules/author/models/author_read_model.dart';
import 'package:homem_maquina_library/modules/genre/models/genre_read_model.dart';

class BookReadModel {
  int? id;
  String? title;
  DateTime? publishTime;
  AuthorReadModel? authorReadModel;
  GenreReadModel? genreReadModel;

  BookReadModel(
      {this.id,
      this.title,
      this.publishTime,
      this.authorReadModel,
      this.genreReadModel});

  BookReadModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    publishTime = DateTime.tryParse(json['publishDate']);
    authorReadModel = AuthorReadModel.fromJson(json['author']);
    genreReadModel = GenreReadModel.fromJson(json['genre']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['publishDate'] = publishTime!.toIso8601String();
    data['author'] =
        AuthorReadModel.toJsonStatic(authorReadModel ?? AuthorReadModel());
    data['genre'] =
        GenreReadModel.toJsonStatic(genreReadModel ?? GenreReadModel());

    return data;
  }

  static Map<String, dynamic> toJsonStatic(BookReadModel model) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = model.id;
    data['name'] = model.title;
    data['publishDate'] = model.publishTime;
    data['author'] = AuthorReadModel.toJsonStatic(
        model.authorReadModel ?? AuthorReadModel());
    data['genre'] =
        GenreReadModel.toJsonStatic(model.genreReadModel ?? GenreReadModel());

    return data;
  }
}
