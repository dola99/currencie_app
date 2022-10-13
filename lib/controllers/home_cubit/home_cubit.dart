import 'package:currencie_app/controllers/home_cubit/home_status.dart';
import 'package:currencie_app/main.dart';
import 'package:currencie_app/models/data/currencie_item_model.dart';
import 'package:currencie_app/repositry/home_repo.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStatus> {
  HomeCubit() : super(HomeIntialStatus());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  Future<Either<String, List<CurrencyItemModel>>> getSupportedCountrys() async {
    emit(LoadingSupportedCountry());
    var supportedCountry = await HomeRepo().getAllSupportedCurrencey();
    if (supportedCountry.isRight) {
      if (localDb.supportedCurrency.isEmpty) {
        await localDb.insertAll(
            supportedCountry.right.supportedCurrencey, 'SupportedCurrency');
        await localDb.getAll();
      }
      await localDb.getAll();
      emit(SupportedCounryLoadedSucessfully(
          supportedCountry: supportedCountry.right.supportedCurrencey));
      return Right(supportedCountry.right.supportedCurrencey);
    } else {
      emit(SupportedCounryLoadedFailed(messageError: supportedCountry.left));
      return Left(supportedCountry.left);
    }
  }

  Future<void> isFirstOpenForApp() async {
    if (localDb.defaultCurrency.isEmpty) {
      var result = await getSupportedCountrys();
      if (result.isRight) {
        emit(FirstOpenForAppStatus(supportedCountry: result.right));
      }
    } else {
      getSupportedCountrys();
    }
  }

  void selectedDefaultCurrencie(CurrencyItemModel currencyItemModel) async {
    localDb.defaultCurrency.add(currencyItemModel);
    emit(DefaultCurrencieSelectedStatus(currencyItemModel: currencyItemModel));
  }
}
