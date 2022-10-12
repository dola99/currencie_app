import 'package:currencie_app/repositry/home_repo.dart';
import 'package:currencie_app/screens/home/widgets/main_currenice_counter.dart';
import 'package:currencie_app/utils/styles/colors_scheme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() async {
    // await HomeRepo().getAllSupportedCurrencey();
    super.didChangeDependencies();
  }

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
            MainCurreniceCounter()
          ],
        ),
      ),
    );
  }
}
