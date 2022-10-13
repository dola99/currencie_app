import 'package:currencie_app/controllers/history_cubit/history_status.dart';
import 'package:currencie_app/models/data/currencie_item_model.dart';
import 'package:currencie_app/repositry/history_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryCubit extends Cubit<HistoryStatus> {
  HistoryCubit() : super(HistoryCurrencyIntialStatus());

  static HistoryCubit get(BuildContext context) => BlocProvider.of(context);

  late Iterable<CurrencyItemModel> listOfSupportedCurrency;

  Future<void> getHistoricalData() async {
    emit(NewCurrecnyloadingStatus());
    var result = await HistoryRepo().getHistoryOfCurrency();
    if (result.isRight) {
      emit(HistoricalCurrecnySuccefulltyStatus(
          historyCurrencyList: result.right.historyCurrencyList));
    }
  }
}
