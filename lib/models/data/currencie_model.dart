class CurrencySupportedModel {
  late bool? success;
  late List<CurrencyItemModel> supportedCurrencey;

  CurrencySupportedModel({
    required this.success,
    required this.supportedCurrencey,
  });

  CurrencySupportedModel.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> mapOfSupportedCurrencey = json['symobls'];
    success = json['success'];
    supportedCurrencey = mapOfSupportedCurrencey.entries
        .map((entry) => CurrencyItemModel(
            titleOfCurrency: entry.value, keyOfCurrencey: entry.key))
        .toList();
    print('gasdsadasa');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;

    return data;
  }
}

class CurrencyItemModel {
  String keyOfCurrencey;
  String titleOfCurrency;
  CurrencyItemModel(
      {required this.keyOfCurrencey, required this.titleOfCurrency});
}
