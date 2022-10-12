import 'package:currencie_app/controllers/home_cubit/home_cubit.dart';
import 'package:currencie_app/controllers/home_cubit/home_status.dart';
import 'package:currencie_app/screens/home/screens/select_default_currenice_screen.dart';
import 'package:currencie_app/screens/home/widgets/grid_view_of_countrys.dart';
import 'package:currencie_app/utils/navigation.dart';
import 'package:currencie_app/utils/styles/colors_scheme.dart';
import 'package:currencie_app/utils/styles/constant.dart';
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
          return SpinKitCircle(
            color: AppColors.textColor,
          );
        } else if (state is FirstOpenForAppStatus) {
          return GridViewOfCountrys(currencieList: state.supportedCountry);
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.primeryContainerColor,
                borderRadius: BorderRadius.circular(Constant.borderRadius),
                border: Border.all(color: AppColors.borderColor)),
            child: Column(
              children: const [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Current Main Currenice',
                  style: TextStyle(
                      color: AppColors.textColor, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        );
      }),
      listener: (context, state) {
        print(state);
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
