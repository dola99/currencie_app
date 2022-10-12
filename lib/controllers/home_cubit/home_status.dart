import 'package:currencie_app/models/data/currencie_item_model.dart';

abstract class HomeStatus {}

class HomeIntialStatus extends HomeStatus {}

class LoadingSupportedCountry extends HomeStatus {}

class SupportedCounryLoadedSucessfully extends HomeStatus {
  late List<CurrencyItemModel> supportedCountry;
  SupportedCounryLoadedSucessfully({required this.supportedCountry});
}

class SupportedCounryLoadedFailed extends HomeStatus {
  late String messageError;
  SupportedCounryLoadedFailed({required this.messageError});
}

class FoundDefaultCurrencyStatus extends HomeStatus {
  late CurrencyItemModel currencyItemModel;
  FoundDefaultCurrencyStatus({required this.currencyItemModel});
}

class NotFoundDefaultCurrencyStatus extends HomeStatus {}

class FirstOpenForAppStatus extends HomeStatus {
  late List<CurrencyItemModel> supportedCountry;
  FirstOpenForAppStatus({required this.supportedCountry});
}
