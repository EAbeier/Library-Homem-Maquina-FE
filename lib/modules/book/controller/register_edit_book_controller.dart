import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homem_maquina_library/config/app_constants.dart';
import 'package:homem_maquina_library/infrastructure/routes.dart';
import 'package:homem_maquina_library/modules/author/models/author_read_model.dart';
import 'package:homem_maquina_library/modules/book/controller/book_controller.dart';
import 'package:homem_maquina_library/modules/book/models/book_read_model.dart';
import 'package:homem_maquina_library/modules/genre/models/genre_read_model.dart';
import 'package:http/http.dart';

class RegisterEditBookController extends GetxController {
  final dio = Dio();
  @override
  void onInit() async {
    super.onInit();
    await listAuthors();
    await listGenre();
    if(Get.arguments != null){
      buildPage(Get.arguments);
    }
  }

  TextEditingController dataController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  List<DropdownMenuItem> authors = [];
  List<DropdownMenuItem> genres = [];
  AuthorReadModel? selectedAuthor;
  GenreReadModel? selectedGenre;
  DateTime? _selectedDate;
  int? id;

  Future<void> selectDate() async {
    var _picked = await showDatePicker(
      context: Get.context!,
      firstDate: DateTime(0),
      lastDate: DateTime(9000),
    );

    if (_picked != null) {
      dataController.text =
          '${_picked.day < 10 ? '0' : ''}${_picked.day}-${_picked.month < 10 ? '0' : ''}${_picked.month}-${_picked.year}';
      _selectedDate = _picked;
    }
  }

  Future<void> listAuthors() async {
    final response = await dio.get(
      '${urlbase}Author/listAuthors',
      options: Options(method: 'GET', headers: requestHeaders),
    );

    if (response.statusCode == 200) {
      for (var data in response.data) {
        var author = AuthorReadModel.fromJson(data);
        authors.add(DropdownMenuItem(value: author, child: Text(author.name!)));
      }
    }
    update();
  }

  Future<void> listGenre() async {
    final response = await dio.get(
      '${urlbase}/Genre/listGenres',
      options: Options(method: 'GET', headers: requestHeaders),
    );

    if (response.statusCode == 200) {
      for (var data in response.data) {
        var genre = GenreReadModel.fromJson(data);
        genres.add(DropdownMenuItem(value: genre, child: Text(genre.name!)));
      }
    }
    update();
  }

  void setAuthor(AuthorReadModel author) {
    selectedAuthor = author;
  }

  void setGenre(GenreReadModel genre) {
    selectedGenre = genre;
  }

  Future<void> save(BuildContext ctx) async {
    if (titleController.text.isEmpty || _selectedDate == null || selectedAuthor == null || selectedGenre == null) {
      if (titleController.text.isEmpty) {
        ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
          content: Text('Title is Empty'),
          backgroundColor: Colors.orange,
        ));
      }

      if (_selectedDate == null) {
        ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
          content: Text('Publishing date is Empty'),
          backgroundColor: Colors.orange,
        ));
      }

      if (selectedAuthor == null) {
        ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
          content: Text('Author is Empty'),
          backgroundColor: Colors.orange,
        ));
      }

      if (selectedGenre == null) {
        ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
          content: Text('Genre is Empty'),
          backgroundColor: Colors.orange,
        ));
      }

      return;
    }

    var bookModel = BookReadModel();
    bookModel.id = null;
    bookModel.title = titleController.text;
    bookModel.publishTime = _selectedDate;
    bookModel.authorReadModel = selectedAuthor;
    bookModel.genreReadModel = selectedGenre;
    var data = bookModel.toJson();
    print(data);

    final response = await dio.post(
      '${urlbase}Book/createBook',
      data: data,
      options: Options(method: 'POST', headers: requestHeadersAuthenticated),
    );
    Get.back();
  }

  Future<void> Edit() async {
    var bookModel = BookReadModel();
    bookModel.id = id;
    bookModel.title = titleController.text;
    bookModel.publishTime = _selectedDate;
    bookModel.authorReadModel = selectedAuthor;
    bookModel.genreReadModel = selectedGenre;
    var data = bookModel.toJson();
    print(data);

    final response = await dio.put(
      '${urlbase}Book/updateBook',
      data: data,
      options: Options(method: 'PUT', headers: requestHeadersAuthenticated),
    );
  }

  void buildPage(BookReadModel model){
    _selectedDate = model.publishTime;
    titleController.text = model.title!;
   var date = model.publishTime!; 
    dataController.text =  '${date.day < 10 ? '0' : ''}${date.day}-${date.month < 10 ? '0' : ''}${date.month}-${date.year}';
  }
}
