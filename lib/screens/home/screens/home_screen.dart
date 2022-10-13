import 'package:currencie_app/screens/home/widgets/main_currenice_counter.dart';
import 'package:currencie_app/utils/styles/colors_scheme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundLiner,
        ),
        child: Column(
          children: const [
            SizedBox(
              height: 40,
            ),
            MainCurreniceCounter(),
          ],
        ),
      ),
    );
  }
}
