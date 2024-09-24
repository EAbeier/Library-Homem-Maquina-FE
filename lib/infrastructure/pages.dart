import 'package:get/get.dart';
import 'package:homem_maquina_library/infrastructure/routes.dart';
import 'package:homem_maquina_library/modules/book/bindings/book_bindings.dart';
import 'package:homem_maquina_library/modules/book/widgets/book_page.dart';
import 'package:homem_maquina_library/modules/book/widgets/edit_book_page.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.Books,
      page: () => const BookPage(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
      bindings: [
        BookBindings(),
      ]
    ),
    GetPage(
      name: Routes.EditBook,
      page: () => const EditBookPage(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
      bindings: [
        BookBindings(),
      ]
    )
  ];
}