import 'package:flutter/material.dart';

class AppPalette {
  AppPalette._();

  static LinearGradient cardbluegreen = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xff23b6e6), // Gradient start color
      Color(0xff02d39a), // Gradient end color
    ],
    stops: [0, 0.93],
  );

  static LinearGradient lighbrowGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromARGB(255, 249, 234, 230),
      Color.fromARGB(255, 255, 204, 188),
    ],
    stops: [0, 0.93],
  );
  static LinearGradient tealshade = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Colors.teal.shade400, Colors.teal.shade600],
    stops: [0, 0.93],
  );

  // Individual Colors
  static const Color successGreen = Color(0xFF329930);
  static const Color errorRed = Color(0xFFE55B48);
  static const Color black = Color(0xFF1A1A1A);
  static const Color white = Color(0xFFFFFFFF);
  static const Color backgroundColor = Color(0xFFFFFAF5);

  // btn colors
}
