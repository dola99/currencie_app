import 'dart:io';
import 'package:currencie_app/models/data/currencie_item_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class LocalDbNames {
  static String supportedCurrencyDbName = 'SupportedCurrency';
  static String defaultCurrencyDbName = 'defaultCurrency';
  static String currencyHistoryDbName = 'CurrencyHistory';
}

class LocalDb {
  late Box<List<CurrencyItemModel>> supportedCurrency;
  late Box<CurrencyItemModel> defaultCurrency;
  late Box currencyHistory;

  Future<void> initOfLocalStorge() async {
    Directory directory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    await Hive.initFlutter();
    Hive.registerAdapter(CurrencyItemModelAdapter());
    supportedCurrency =
        await openDataBase<List<CurrencyItemModel>>('SupportedCurrency');

    defaultCurrency = await openDataBase<CurrencyItemModel>('defaultCurrency');
    currencyHistory = await openDataBase('CurrencyHistory');
  }

  Future<Box<E>> openDataBase<E>(String nameOfDB) async {
    return Hive.openBox<E>(nameOfDB);
  }
}
