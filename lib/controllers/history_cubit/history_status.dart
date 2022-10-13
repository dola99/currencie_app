import 'package:currencie_app/models/data/history_currency_model.dart';

abstract class HistoryStatus {}

class HistoryCurrencyIntialStatus extends HistoryStatus {}

class NewCurrecnyloadingStatus extends HistoryStatus {}

class HistoricalCurrecnySuccefulltyStatus extends HistoryStatus {
  late List<HistoryModel> historyCurrencyList;
  HistoricalCurrecnySuccefulltyStatus({required this.historyCurrencyList});
}
