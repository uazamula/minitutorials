import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
    Container(height: 120,color: Colors.green),
    SizedBox(height: 50,),
    Container(height: 120,color: Colors.red),
    Spacer(),//flexible size
    Container(height: 120,color: Colors.blue),
    ]);
  }
}
