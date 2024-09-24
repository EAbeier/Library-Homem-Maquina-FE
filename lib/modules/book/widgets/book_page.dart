import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homem_maquina_library/infrastructure/routes.dart';
import 'package:homem_maquina_library/modules/book/controller/book_controller.dart';
import 'package:homem_maquina_library/modules/widgets/table_widget.dart';

class BookPage extends StatelessWidget {
  const BookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookController>(builder: (ctx) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Homem Máquina Library'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: TableWidget(
                  tableHeaders: ctx.temp,
                  tableDatas: ctx.widgets),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => Get.toNamed(Routes.EditBook)!.then((value) =>{
              ctx.listBooks()
          } ),
        ),
      );
    });
    
  }
}
