import 'package:currencie_app/controllers/converted_cubit/converted_status.dart';
import 'package:currencie_app/main.dart';
import 'package:currencie_app/models/data/currencie_item_model.dart';
import 'package:currencie_app/repositry/converted_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConvertedCubit extends Cubit<ConvertedStatus> {
  ConvertedCubit() : super(ConvertedIntialStatus());

  static ConvertedCubit get(BuildContext context) => BlocProvider.of(context);

  TextEditingController firstCurrencieTextController = TextEditingController();
  TextEditingController secondCurrencieTextController = TextEditingController();
  Future<void> convertedCurrencie() async {
    var result = await ConvertedRepo().convertedCurrency(
        convertedModel.firstCurrencie!.currencyId!,
        convertedModel.secondCurrencie!.currencyId!);
    convertedModel.firstCurrencie!.valueOfCurrencie =
        result.values.elementAt(0);
    firstCurrencieTextController.text = result.values.elementAt(0).toString();
    convertedModel.secondCurrencie!.valueOfCurrencie =
        result.values.elementAt(1);
    secondCurrencieTextController.text =
        '${result.values.elementAt(1).toStringAsFixed(5)}';

    emit(CurrencyConverted());
  }

  Future<void> selectedFirstCurrency(
      CurrencyItemModel currencyItemModel) async {
    convertedModel.selectFirstCurrencie(currencyItemModel);
    if (convertedModel.secondCurrencie != null) {
      await convertedCurrencie();
    } else {
      emit(FirstCurrencieSelected());
    }
  }

  Future<void> selectedSecondCurrency(
      CurrencyItemModel currencyItemModel) async {
    convertedModel.selectSecondCurrencie(currencyItemModel);
    if (convertedModel.firstCurrencie != null) {
      await convertedCurrencie();
    } else {
      emit(SecondCurrencieSelected());
    }
  }

  void changeFirstCurrencyAmount(num firstCurrencieAmount) {
    secondCurrencieTextController.text = convertedModel
        .changeFirstAmount(firstCurrencieAmount)!
        .toStringAsFixed(5);
    emit(AmountChangedStatus());
  }

  void changeSecondCurrencyAmount(num secondCurrencieAmount) {
    firstCurrencieTextController.text = convertedModel
        .changeSecondAmount(secondCurrencieAmount)!
        .toStringAsFixed(5);
    emit(AmountChangedStatus());
  }
}
