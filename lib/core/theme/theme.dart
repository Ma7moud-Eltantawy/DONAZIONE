import 'package:flutter/material.dart';

import '../manager/colors_manager.dart';

ThemeData appTheme(BuildContext context) {
  return ThemeData(


    fontFamily: "varela",
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(ColorsManager.primary))),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            color: ColorsManager.primary,
            fontFamily: "varela",
          ),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(

      iconTheme: IconThemeData(
        color: ColorsManager.red,
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: "varela",

        color: ColorsManager.primary,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),
  );
}
