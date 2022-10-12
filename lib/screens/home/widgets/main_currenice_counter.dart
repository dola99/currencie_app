import 'package:currencie_app/controllers/home_cubit/home_cubit.dart';
import 'package:currencie_app/controllers/home_cubit/home_status.dart';
import 'package:currencie_app/utils/styles/colors_scheme.dart';
import 'package:currencie_app/utils/styles/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCurreniceCounter extends StatelessWidget {
  const MainCurreniceCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStatus>(
        builder: ((context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.primeryContainerColor,
                  borderRadius: BorderRadius.circular(Constant.borderRadius),
                  border: Border.all(color: AppColors.borderColor)),
              child: Column(
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Current Main Currenice',
                    style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          );
        }),
        listener: (context, state) {});
  }
}
