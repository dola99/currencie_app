import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
part 'currencie_item_model.g.dart';

@HiveType(typeId: 1)
@immutable
class CurrencyItemModel {
  @HiveField(0)
  late String? countryId;
  @HiveField(1)
  late String? counrtyName;
  @HiveField(2)
  late String? currencyId;
  @HiveField(3)
  late String? currenceyName;
  @HiveField(4)
  late String? currenceySymbol;
  @HiveField(5)
  late String? flagUrl;

  late double? valueOfCurrencie;
  CurrencyItemModel(
      {this.countryId,
      this.counrtyName,
      this.currencyId,
      this.currenceyName,
      this.currenceySymbol,
      this.valueOfCurrencie,
      this.flagUrl});
}
