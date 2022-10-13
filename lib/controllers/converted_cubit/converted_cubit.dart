import 'package:currencie_app/controllers/converted_cubit/converted_status.dart';
import 'package:currencie_app/main.dart';
import 'package:currencie_app/models/data/currencie_item_model.dart';
import 'package:currencie_app/repositry/converted_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConvertedCubit extends Cubit<ConvertedStatus> {
  ConvertedCubit() : super(ConvertedIntialStatus());

  static ConvertedCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> convertedCurrencie(
      String firstCurrencie, String secondCurrencie) async {
    var result = await ConvertedRepo()
        .convertedCurrency(firstCurrencie, secondCurrencie);
    convertedModel.firstCurrencie!.valueOfCurrencie = result.right;
    convertedModel.secondCurrencie!.valueOfCurrencie = result.left;
    emit(CurrencyConverted());
  }

  void selectedFirstCurrency(CurrencyItemModel currencyItemModel) {
    convertedModel.selectFirstCurrencie(currencyItemModel);
    emit(FirstCurrencieSelected());
  }

  void selectedSecondCurrency(CurrencyItemModel currencyItemModel) {
    convertedModel.selectSecondCurrencie(currencyItemModel);
    emit(SecondCurrencieSelected());
  }
}
