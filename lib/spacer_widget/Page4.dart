import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(height: 120, color: Colors.green),
        Container(height: 120, color: Colors.red),
        Container(height: 120, color: Colors.blue),
      ],
    );
  }
}
