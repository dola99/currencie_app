import 'package:currencie_app/models/data/currencie_item_model.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

class GridViewOfCountrys extends StatelessWidget {
  final List<CurrencyItemModel> currencieList;
  const GridViewOfCountrys({super.key, required this.currencieList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemBuilder: (context, index) {
        return Container(
          child: Column(
            children: [
              ImageNetwork(
                  image: currencieList[index].flagUrl!, height: 20, width: 20)
            ],
          ),
        );
      },
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
    );
  }
}
