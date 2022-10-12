import 'package:currencie_app/bootstrap.dart';
import 'package:currencie_app/controllers/home_cubit/home_cubit.dart';
import 'package:currencie_app/models/local_db/local_db_module.dart';
import 'package:currencie_app/screens/home/screens/home_screen.dart';
import 'package:currencie_app/utils/styles/colors_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  AppColors().statusBarColor;
  registerSingletons();
  await localDb.initOfLocalStorge();
  bootstrap(() => const StartPointMyApp());
}

class StartPointMyApp extends StatelessWidget {
  const StartPointMyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<HomeCubit>(
            create: (context) => HomeCubit(),
          ),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        ));
  }
}

void registerSingletons() {
  GetIt.I.registerLazySingleton<LocalDb>(() => LocalDb());
}

LocalDb get localDb => GetIt.I.get<LocalDb>();
