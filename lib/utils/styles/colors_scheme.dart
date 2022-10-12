import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppColors {
  final Color white = Colors.white;
  final Color black = const Color(0xFF1E1B18);

  final statusBarColor = SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  static const LinearGradient backgroundLiner = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color.fromRGBO(69, 39, 139, 1), Color.fromRGBO(46, 51, 90, 1)]);

  static const primeryContainerColor = Color.fromRGBO(72, 49, 157, .20);
  static const borderColor = Color.fromRGBO(255, 255, 255, .20);
  static const textColor = Colors.white;
}
