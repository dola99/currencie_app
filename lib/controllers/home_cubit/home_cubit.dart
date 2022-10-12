import 'package:currencie_app/controllers/home_cubit/home_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStatus> {
  HomeCubit() : super(HomeIntialStatus());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);
}
