import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homem_maquina_library/config/app_constants.dart';
import 'package:homem_maquina_library/infrastructure/routes.dart';
import 'package:homem_maquina_library/modules/book/models/book_read_model.dart';

class BookController extends GetxController {
  final dio = Dio();
  List<List<Widget>> widgets = [];
  var temp = const ['Title', 'Release Date', 'Edit', 'Delete'];
  @override
  void onInit() async {
    super.onInit();
    await listBooks();
    await login();
  }

  @override
  void onReady() async {
    update();
  }

  Future<void> listBooks() async {
    widgets = [];
    final response = await dio.get(
      '${urlbase}Book/listBooks',
      options: Options(method: 'GET', headers: requestHeaders),
    );

    if (response.statusCode == 200) {
      List<BookReadModel> books = [];
      for (var data in response.data) {
        books.add(BookReadModel.fromJson(data));
      }

      for (var item in books) {
        var publishingDate = 'N/A';
        if (item.publishTime != null) {
          var date = item.publishTime!;
          publishingDate =
              '${date.day < 10 ? '0' : ''}${date.day}-${date.month < 10 ? '0' : ''}${date.month}-${date.year}';
        }
        widgets.add([
          Text(item.title!),
          Text(publishingDate),
          InkWell(child: const Icon(Icons.edit), onTap: () => Get.toNamed(Routes.EditBook, arguments: item),),
          InkWell(
            child: const Icon(Icons.delete),
            onTap: () => deleteBook(item.id!),
          )
        ]);
      }
    }
    update();
  }

  Future<void> deleteBook(int id) async {
    final response = await dio.delete(
      '${urlbase}Book/deleteBook/${id}',
      options: Options(method: 'DELETE', headers: requestHeaders),
    );
    listBooks();
  }


  Future<void> login() async {
      var data = "{\"username\": \"Emerson\",\"password\": \"emerson\"}";
      final response = await dio.post(
      '${urlbase}Login/login/', data: data,
      options: Options(method: 'DELETE', headers: requestHeaders));
      requestHeadersAuthenticated = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${response}'
      };
      print(response);
      print(requestHeadersAuthenticated);
    
  }
}
