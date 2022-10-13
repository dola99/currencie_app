import 'package:currencie_app/controllers/history_cubit/history_cubit.dart';
import 'package:currencie_app/controllers/history_cubit/history_status.dart';
import 'package:currencie_app/utils/styles/colors_scheme.dart';
import 'package:currencie_app/utils/styles/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoricalContainer extends StatelessWidget {
  const HistoricalContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HistoryCubit, HistoryStatus>(
        listener: ((context, state) {}),
        builder: ((context, state) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.primeryContainerColor,
                borderRadius: BorderRadius.circular(Constant.borderRadius),
                border: Border.all(color: AppColors.borderColor)),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'History Currency',
                  style: TextStyle(
                      color: AppColors.textColor, fontWeight: FontWeight.bold),
                ),
                if (state is HistoricalCurrecnySuccefulltyStatus)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Date',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'EUR',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'EGP',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.historyCurrencyList.length,
                            itemBuilder: ((context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      state.historyCurrencyList[index].date,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    const Text(
                                      '1',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      '${state.historyCurrencyList[index].valueOfCurrency}',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              );
                            })),
                      ],
                    ),
                  ),
              ],
            ),
          );
        }));
  }
}
