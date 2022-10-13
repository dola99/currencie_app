import 'package:currencie_app/controllers/home_cubit/home_cubit.dart';
import 'package:currencie_app/controllers/home_cubit/home_status.dart';
import 'package:currencie_app/screens/home/widgets/converter_container.dart';
import 'package:currencie_app/screens/home/widgets/default_currencie_container.dart';
import 'package:currencie_app/screens/home/widgets/grid_view_of_countrys.dart';
import 'package:currencie_app/utils/styles/colors_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MainCurreniceCounter extends StatefulWidget {
  const MainCurreniceCounter({Key? key}) : super(key: key);

  @override
  State<MainCurreniceCounter> createState() => _MainCurreniceCounterState();
}

class _MainCurreniceCounterState extends State<MainCurreniceCounter> {
  @override
  void initState() {
    HomeCubit.get(context).isFirstOpenForApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStatus>(
      builder: ((context, state) {
        if (state is LoadingSupportedCountry) {
          return const SizedBox(
            child: Center(
              child: SpinKitCircle(
                color: AppColors.textColor,
              ),
            ),
          );
        } else if (state is FirstOpenForAppStatus) {
          return Expanded(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Select Default Currencie',
                  style: TextStyle(
                      color: AppColors.textColor, fontWeight: FontWeight.bold),
                ),
                Expanded(
                    child: GridViewOfCountrys(
                        currencieList: state.supportedCountry)),
              ],
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: const [
                DefultCurrencieContainer(),
                SizedBox(
                  height: 20,
                ),
                ConverterDialog()
              ],
            ),
          );
        }
      }),
      listener: (context, state) {
        if (state is SupportedCounryLoadedFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(milliseconds: 2000),
              content: Text(
                state.messageError,
              ),
            ),
          );
        }
      },
    );
  }
}
