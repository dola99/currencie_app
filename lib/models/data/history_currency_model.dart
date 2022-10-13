class HistoryCurrencyModel {
  late List<HistoryModel> historyCurrencyList;

  HistoryCurrencyModel({
    required this.historyCurrencyList,
  });

  HistoryCurrencyModel.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> mapOfHistoricalCurrency = json['EUR_EGP'];

    historyCurrencyList = mapOfHistoricalCurrency.entries
        .map((entry) => HistoryModel(
              date: entry.key,
              valueOfCurrency: entry.value,
            ))
        .toList();
  }
}

class HistoryModel {
  String date;
  double valueOfCurrency;
  HistoryModel({required this.date, required this.valueOfCurrency});
}
