import 'package:flutter/material.dart';

class AppColors {
  final Color white = Colors.white;
  final Color black = const Color(0xFF1E1B18);

  static const LinearGradient backgroundLiner = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color.fromRGBO(69, 39, 139, 1), Color.fromRGBO(46, 51, 90, 1)]);
}
