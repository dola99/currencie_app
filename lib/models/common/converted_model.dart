import 'package:currencie_app/models/data/currencie_item_model.dart';

class ConvertedModel {
  CurrencyItemModel? firstCurrencie;
  CurrencyItemModel? secondCurrencie;

  void selectFirstCurrencie(CurrencyItemModel currencyItemModel) {
    firstCurrencie = currencyItemModel;
  }

  void selectSecondCurrencie(CurrencyItemModel currencyItemModel) {
    secondCurrencie = currencyItemModel;
  }

  num? changeFirstAmount(num firstCurrencieAmount) {
    var newSecondAmount =
        firstCurrencieAmount * secondCurrencie!.valueOfCurrencie!;

    return newSecondAmount;
  }

  num? changeSecondAmount(num secondCurrencieAmount) {
    var newFirstAmount =
        secondCurrencieAmount / secondCurrencie!.valueOfCurrencie!;
    return newFirstAmount;
  }
}
