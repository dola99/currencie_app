import 'package:currencie_app/controllers/home_cubit/home_cubit.dart';
import 'package:currencie_app/models/data/currencie_item_model.dart';
import 'package:currencie_app/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

class GridViewOfCountrys extends StatelessWidget {
  final List<CurrencyItemModel> currencieList;
  const GridViewOfCountrys({super.key, required this.currencieList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: currencieList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            HomeCubit.get(context)
                .selectedDefaultCurrencie(currencieList[index]);
          },
          child: Column(
            children: [
              ImageNetwork(
                  image: currencieList[index].flagUrl!, height: 20, width: 20),
              const SizedBox(
                height: 20,
              ),
              Text(
                '${currencieList[index].currenceySymbol}',
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '${currencieList[index].counrtyName}',
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
        );
      },
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
    );
  }
}
