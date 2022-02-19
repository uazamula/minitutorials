import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(height: 120, color: Colors.green),
      Spacer(), //flexible size
      Container(height: 120, color: Colors.red),
      Spacer(), //flexible size
      Container(height: 120, color: Colors.blue),
    ]);
  }
}
