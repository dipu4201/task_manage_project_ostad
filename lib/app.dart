import 'package:flutter/material.dart';
import 'package:task_manage_1_project/ui/screen/auth/splash_screen.dart';
import 'package:task_manage_1_project/ui/utility/app_colors.dart';

class TasksManegerApp extends StatelessWidget {
  const TasksManegerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      theme: lightThemeData(),
    );
  }

  ThemeData lightThemeData() {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        hintStyle: TextStyle(
          color: Colors.grey.shade300
        ),
        border: OutlineInputBorder(borderSide: BorderSide.none),
      ),
      textTheme:const TextTheme(
        titleLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),
        titleSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          letterSpacing: 0.4
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.themeColor,
          padding: EdgeInsets.symmetric(vertical: 10),
          foregroundColor: AppColors.white,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      textButtonTheme : TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.grey,
          textStyle: TextStyle(
            fontWeight: FontWeight.w600
          )
        )
      )
    );
  }
}
