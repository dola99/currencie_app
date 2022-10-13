import 'dart:io';
import 'package:currencie_app/models/data/currencie_item_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class LocalDbNames {
  static String supportedCurrencyDbName = 'SupportedCurrency';
  static String defaultCurrencyDbName = 'defaultCurrency';
}

class LocalDb {
  late Box<CurrencyItemModel> supportedCurrency;
  late Iterable<CurrencyItemModel> listOfSupportedCurrency;
  late Box<CurrencyItemModel> defaultCurrency;
  late Box<CurrencyItemModel> currencyHistory;

  Future<void> initOfLocalStorge() async {
    Directory directory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    await Hive.initFlutter();
    Hive.registerAdapter(CurrencyItemModelAdapter());
    supportedCurrency = await openDataBase<CurrencyItemModel>(
        LocalDbNames.supportedCurrencyDbName);

    defaultCurrency = await openDataBase<CurrencyItemModel>(
        LocalDbNames.defaultCurrencyDbName);
  }

  Future<Box<E>> openDataBase<E>(String nameOfDB) async {
    return Hive.openBox<E>(nameOfDB);
  }

  Future<LazyBox<E>> openLazyDataBase<E>(String nameOfDB) async {
    return Hive.openLazyBox<E>(nameOfDB);
  }

  Future<void> insertAll(
      List<CurrencyItemModel> userList, String nameOfDB) async {
    supportedCurrency.addAll(userList);
    await supportedCurrency.close();
  }

  Future<void> getAll() async {
    // final box = await Hive.openBox(LocalDbNames.supportedCurrencyDbName);
    if (!supportedCurrency.isOpen) {
      supportedCurrency =
          await Hive.openBox(LocalDbNames.supportedCurrencyDbName);
    }
    final currencyItemlist = supportedCurrency.values;

    listOfSupportedCurrency = currencyItemlist;
    //listOfSupportedCurrency = currencyItemlist;
    // await supportedCurrency.close();
  }
}
