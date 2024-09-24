import 'package:get/get.dart';
import 'package:homem_maquina_library/modules/book/controller/book_controller.dart';
import 'package:homem_maquina_library/modules/book/controller/register_edit_book_controller.dart';

class BookBindings implements Bindings{
  @override
  void dependencies(){
    Get.lazyPut<BookController>(() => BookController(), fenix: true);
    Get.lazyPut<RegisterEditBookController>(() => RegisterEditBookController(), fenix: true);
  }
}