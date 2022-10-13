import 'package:currencie_app/controllers/converted_cubit/converted_cubit.dart';
import 'package:currencie_app/controllers/converted_cubit/converted_status.dart';
import 'package:currencie_app/main.dart';
import 'package:currencie_app/screens/home/widgets/empty_select_cureencie.dart';
import 'package:currencie_app/screens/home/widgets/selected_currencie_for_converted.dart';
import 'package:currencie_app/utils/styles/colors_scheme.dart';
import 'package:currencie_app/utils/styles/constant.dart';
import 'package:currencie_app/widgets/dialog_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConverterDialog extends StatelessWidget {
  const ConverterDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConvertedCubit, ConvertedStatus>(
        listener: ((context, state) {}),
        builder: ((context, state) {
          return Container(
            decoration: BoxDecoration(
                color: AppColors.primeryContainerColor,
                borderRadius: BorderRadius.circular(Constant.borderRadius),
                border: Border.all(color: AppColors.borderColor)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () async {
                      return await showDialog(
                        context: context,
                        builder: (context) {
                          return const DialogSelection();
                        },
                      );
                    },
                    child: convertedModel.firstCurrencie == null
                        ? const EmpthySelectedCurrencie()
                        : SelectedCurrencieForConvert(
                            currencyItemModel: convertedModel.firstCurrencie!),
                  ),
                  GestureDetector(
                    onTap: () async {
                      return await showDialog(
                        context: context,
                        builder: (context) {
                          return const DialogSelection();
                        },
                      );
                    },
                    child: convertedModel.secondCurrencie == null
                        ? const EmpthySelectedCurrencie()
                        : SelectedCurrencieForConvert(
                            currencyItemModel: convertedModel.secondCurrencie!),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
