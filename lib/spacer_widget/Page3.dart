import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(height: 120, color: Colors.green),
      Spacer(flex: 1), //flexible size
      Container(height: 120, color: Colors.red),
      Spacer(flex: 2), //flexible size
      Container(height: 120, color: Colors.blue),
    ]);
  }
}
