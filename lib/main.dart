import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homem_maquina_library/config/dependency_injection.dart';
import 'package:homem_maquina_library/infrastructure/app_theme.dart';
import 'package:homem_maquina_library/infrastructure/pages.dart';
import 'package:homem_maquina_library/infrastructure/routes.dart';
import 'package:homem_maquina_library/modules/book/widgets/book_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homem Máquina',
      home: GetMaterialApp(
        title: "Blabblling",
        getPages: AppPages.pages,
        initialRoute: Routes.Books,
        theme: theme,
        locale: Get.deviceLocale,
      ),
    );
  }
}
