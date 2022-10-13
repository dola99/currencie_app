import 'dart:developer';
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
  late Box<CurrencyItemModel> supportedCurrency;
  late Iterable<CurrencyItemModel> listOfSupportedCurrency;
  late Box<CurrencyItemModel> defaultCurrency;
  late Box currencyHistory;

  Future<void> initOfLocalStorge() async {
    Directory directory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    await Hive.initFlutter();
    Hive.registerAdapter(CurrencyItemModelAdapter());
    supportedCurrency =
        await openDataBase<CurrencyItemModel>('SupportedCurrency');

    defaultCurrency = await openDataBase<CurrencyItemModel>('defaultCurrency');
    currencyHistory = await openDataBase('CurrencyHistory');
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
    //final box = await Hive.openBox('SupportedCurrency');
    final currencyItemlist = supportedCurrency.values;
    inspect(supportedCurrency.values.first);
    inspect(currencyItemlist.elementAt(2));
    listOfSupportedCurrency = currencyItemlist;
    //listOfSupportedCurrency = currencyItemlist;
    // await supportedCurrency.close();
  }
/*
  Future<void> delete(int idUser) async {
    final box = await Hive.openBox('user_box');
    box.delete(idUser);
    await box.close();
  }

  Future<void> insert(User user) async {
    final box = await Hive.openBox('user_box');
    box.add(user);
    await box.close();
  }

  Future<void> update(int idUser, User user) async {
    final box = await Hive.openBox('user_box');
    box.put(idUser, user);
    await box.close();
  }

  Future<List<User>> getAll() async {
    final box = await Hive.openBox('user_box');
    final userList = box.values;
    await box.close();
    return userList;
  }*/
}
