import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class LocalDb {
  Future<void> initOfLocalStorge() async {
    Directory directory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(directory.path);
  }

  Future<void> openDataBase(String nameOfDB) async {
    await Hive.openBox(nameOfDB);
  }
}
