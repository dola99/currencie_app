import 'package:currencie_app/models/data/currencie_item_model.dart';

class CurrencySupportedModel {
  late List<CurrencyItemModel> supportedCurrencey;

  CurrencySupportedModel({
    required this.supportedCurrencey,
  });

  CurrencySupportedModel.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> mapOfSupportedCurrencey = json['results'];

    supportedCurrencey = mapOfSupportedCurrencey.entries
        .map((entry) => CurrencyItemModel(
            countryId: entry.key,
            counrtyName: entry.value['name'],
            currenceyName: entry.value['currencyName'],
            currenceySymbol: entry.value['currencySymbol'],
            currencyId: entry.value['currencyId'],
            flagUrl:
                'https://flagcdn.com/60x45/${entry.key.toLowerCase()}.png'))
        .toList();
  }
}
