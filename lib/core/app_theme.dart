import 'package:flutter/material.dart';
import 'app_colors.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.white,
  textTheme: const TextTheme(
    titleLarge: TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.black),
    titleMedium: TextStyle(fontSize: 18, color: AppColors.black87),
  ),
  // Add more theme customizations here
);
