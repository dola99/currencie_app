import 'package:currencie_app/bootstrap.dart';
import 'package:currencie_app/models/local_db/local_db_module.dart';
import 'package:currencie_app/screens/home/screens/home_screen.dart';
import 'package:currencie_app/utils/styles/colors_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDb().initOfLocalStorge();
  await dotenv.load(fileName: ".env");
  AppColors().statusBarColor;
  bootstrap(() => const StartPointMyApp());
}

class StartPointMyApp extends StatelessWidget {
  const StartPointMyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
