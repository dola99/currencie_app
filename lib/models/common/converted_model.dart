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
}
