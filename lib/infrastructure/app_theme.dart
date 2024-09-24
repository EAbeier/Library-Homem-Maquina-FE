import 'package:flutter/material.dart';
import 'package:homem_maquina_library/infrastructure/app_colors.dart';

final theme = ThemeData(
      brightness: Brightness.light,
      primaryColor: whiteColor,
      scaffoldBackgroundColor: whiteColor,
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: orange
        ),
        labelLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.normal,
          color: orange
        ),
        bodyMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.normal,
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
    );

