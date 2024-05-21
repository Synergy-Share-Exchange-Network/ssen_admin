import 'package:flutter/material.dart';

class SOutlineButton {
  SOutlineButton._();
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.black,
      elevation: 0, // Foreground color for enabled state
      side: const BorderSide(color: Color(0xFFd9d9d9)),
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ).copyWith(
      side: MaterialStateProperty.all(BorderSide(color: Color(0xFFd9d9d9))),
    ),
  );

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.white,
      elevation: 0, // Foreground color for enabled state
      side: const BorderSide(color: Color(0xFFd9d9d9)),
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ).copyWith(
      side: MaterialStateProperty.all(BorderSide(color: Color(0xFFd9d9d9))),
    ),
  );
}
