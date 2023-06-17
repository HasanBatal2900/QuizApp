import 'package:flutter/material.dart';

class ThemeingData extends ChangeNotifier {
  ThemeData darkTheme = ThemeData();

  ThemeData lightTheme = ThemeData.light().copyWith(
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
        iconColor: MaterialStateColor.resolveWith((states) => Colors.white),
      )),
      primaryColor: Colors.black,
      brightness: Brightness.light,
      hintColor: Colors.black54,
      cardColor: Colors.grey.shade300,
      scaffoldBackgroundColor: Colors.white,
      buttonTheme: ButtonThemeData(
          colorScheme: const ColorScheme.dark().copyWith(
              primary: Colors.white,
              background: const Color.fromARGB(255, 28, 2, 72),
              onPrimary: const Color.fromARGB(255, 174, 152, 236))),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateTextStyle.resolveWith(
            (states) => const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      textTheme: const TextTheme(
          bodyMedium: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
          bodyLarge: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400)));
}
