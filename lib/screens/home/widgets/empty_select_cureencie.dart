import 'package:flutter/material.dart';

class EmpthySelectedCurrencie extends StatelessWidget {
  const EmpthySelectedCurrencie({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: Text(
        'Select Currencie',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
