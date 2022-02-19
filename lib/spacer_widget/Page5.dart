import 'package:flutter/material.dart';

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,//ignored
      children: [
        Container(height: 120, color: Colors.green),
        Container(height: 120, color: Colors.red),
        Spacer(), //flexible size
        Container(height: 120, color: Colors.blue),
      ],
    );
  }
}
