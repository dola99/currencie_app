import 'package:currencie_app/controllers/converted_cubit/converted_cubit.dart';
import 'package:currencie_app/main.dart';
import 'package:currencie_app/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

class DialogSelection extends StatelessWidget {
  const DialogSelection({Key? key, this.onTap}) : super(key: key);
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 16,
      child: SizedBox(
        height: 300,
        child: ListView.builder(
            itemCount: localDb.listOfSupportedCurrency.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  ConvertedCubit.get(context).selectedFirstCurrency(
                      localDb.listOfSupportedCurrency.elementAt(index));
                  CustomFunctions.popScreen(context);
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        ImageNetwork(
                            height: 20,
                            width: 20,
                            image: localDb.listOfSupportedCurrency
                                .elementAt(index)
                                .flagUrl!),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(localDb.listOfSupportedCurrency
                            .elementAt(index)
                            .currenceyName!)
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
