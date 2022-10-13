import 'package:cached_network_image/cached_network_image.dart';
import 'package:currencie_app/main.dart';
import 'package:currencie_app/models/data/currencie_item_model.dart';
import 'package:currencie_app/utils/styles/colors_scheme.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

class SelectedCurrencieForConvert extends StatelessWidget {
  final CurrencyItemModel currencyItemModel;
  const SelectedCurrencieForConvert({Key? key, required this.currencyItemModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Selected Currenice',
            style: TextStyle(
                color: AppColors.textColor, fontWeight: FontWeight.normal),
          ),
          const SizedBox(
            height: 10,
          ),
          ImageNetwork(
              imageCache:
                  CachedNetworkImageProvider(currencyItemModel.flagUrl!),
              image: currencyItemModel.flagUrl!,
              height: 60,
              width: 60),
          const SizedBox(
            height: 20,
          ),
          Text(
            '${currencyItemModel.currenceyName}',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            '${currencyItemModel.counrtyName}',
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          if (currencyItemModel.valueOfCurrencie != null)
            Text(
              '${currencyItemModel.valueOfCurrencie}',
              style: const TextStyle(color: Colors.white),
            )
        ],
      ),
    );
  }
}
