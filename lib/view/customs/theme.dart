import 'package:flutter/material.dart';
import 'colors.dart';

ThemeData getTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Helvetica',
    checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.resolveWith((_) => Colors.black),
        fillColor: MaterialStateProperty.resolveWith((_) => Colors.black),
        side: AlwaysActiveBorderSide()),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      focusColor: AppColors.secondaryColor,
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.secondaryColor),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: const EdgeInsets.all(15),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
        borderSide: BorderSide(
          style: BorderStyle.none,
        ),
      ),
      disabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
        borderSide: BorderSide(
          width: 0.7,
          color: Colors.black38,
          style: BorderStyle.solid,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
        borderSide: BorderSide(
          width: 0.7,
          color: Colors.black38,
          style: BorderStyle.solid,
        ),
      ),
    ),
  );
}

class AlwaysActiveBorderSide extends MaterialStateBorderSide {
  @override
  BorderSide resolve(_) => const BorderSide(color: Colors.black54);
}
