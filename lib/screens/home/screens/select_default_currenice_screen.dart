import 'package:currencie_app/utils/styles/colors_scheme.dart';
import 'package:flutter/material.dart';

class SelectDefaultCurrencieScreen extends StatelessWidget {
  const SelectDefaultCurrencieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundLiner,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Select Default Currencie',
              style: TextStyle(
                  color: AppColors.textColor, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
