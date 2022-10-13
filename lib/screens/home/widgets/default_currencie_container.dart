import 'package:cached_network_image/cached_network_image.dart';
import 'package:currencie_app/main.dart';
import 'package:currencie_app/utils/styles/colors_scheme.dart';
import 'package:currencie_app/utils/styles/constant.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

class DefultCurrencieContainer extends StatelessWidget {
  const DefultCurrencieContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
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
            'Current Main Currenice',
            style: TextStyle(
                color: AppColors.textColor, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          ImageNetwork(
              imageCache: CachedNetworkImageProvider(
                  localDb.defaultCurrency.getAt(0)!.flagUrl!),
              image: localDb.defaultCurrency.getAt(0)!.flagUrl!,
              height: 60,
              width: 60),
          const SizedBox(
            height: 20,
          ),
          Text(
            '${localDb.defaultCurrency.getAt(0)!.currenceyName}',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            '${localDb.defaultCurrency.getAt(0)!.counrtyName}',
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
