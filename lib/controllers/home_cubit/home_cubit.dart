import 'dart:ffi';

import 'package:currencie_app/controllers/home_cubit/home_status.dart';
import 'package:currencie_app/main.dart';
import 'package:currencie_app/repositry/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStatus> {
  HomeCubit() : super(HomeIntialStatus());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getSupportedCountrys() async {
    emit(LoadingSupportedCountry());
    var supportedCountry = await HomeRepo().getAllSupportedCurrencey();
    if (supportedCountry.isRight) {
      localDb.supportedCurrency.add(supportedCountry.right.supportedCurrencey);
      emit(SupportedCounryLoadedSucessfully(
          supportedCountry: supportedCountry.right.supportedCurrencey));
    } else {
      emit(SupportedCounryLoadedFailed(messageError: supportedCountry.left));
    }
  }

  Future<void> isFirstOpenForApp() async {
    if (localDb.defaultCurrency.isEmpty) {
      await getSupportedCountrys();
      emit(FirstOpenForAppStatus());
    } else {
      getSupportedCountrys();
    }
  }
}
