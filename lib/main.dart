import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_media/ui/colors.dart';
import 'package:social_media/ui/dashboard/dashboard.dart';
import 'package:social_media/ui/home/home_page.dart';

import 'ui/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final base = ThemeData.light();
    final colorScheme =
        ColorScheme.fromSwatch(primarySwatch: Colors.teal).copyWith(
      primaryContainer: AppColors.themeColor,
      surfaceVariant: AppColors.lightGray,
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        shadowColor: Colors.black.withOpacity(0.125),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        colorScheme: colorScheme,
        buttonTheme: const ButtonThemeData(
          shape: StadiumBorder(),
        ),
        primarySwatch: Colors.teal,
        primaryColor: AppColors.primary,
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Colors.black),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: AppColors.accent,
          backgroundColor: Colors.white,
        ),
        textTheme: base.textTheme
            .copyWith(
              headlineLarge: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              headlineSmall: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
            .apply(
              displayColor: Colors.black,
              fontFamily: "Poppins",
            )
            .copyWith(
              bodySmall: const TextStyle(
                color: AppColors.gray,
                fontFamily: "Poppins",
              ),
            ),
      ),
      home: const Dashboard(),
    );
  }
}
