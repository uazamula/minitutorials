import 'package:flutter/material.dart';
import 'package:minitutorials/expanded_widget/Page1.dart';
import 'package:minitutorials/expanded_widget/Page2.dart';
import 'package:minitutorials/expanded_widget/Page3.dart';
import 'package:minitutorials/expanded_widget/Page4.dart';
import 'package:minitutorials/expanded_widget/Page5.dart';
import 'package:minitutorials/expanded_widget/Page6.dart';
import 'package:minitutorials/expanded_widget/Page7.dart';
import 'package:minitutorials/expanded_widget/Page8.dart';
import 'package:minitutorials/expanded_widget/Page9.dart';

class MyExpandedWidget extends StatefulWidget {
  const MyExpandedWidget({Key? key}) : super(key: key);

  @override
  _MyExpandedWidget createState() => _MyExpandedWidget();
}

class _MyExpandedWidget extends State<MyExpandedWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expanded Widget)')),
      body: PageView(children: const [
        Page1(),
        Page2(),
        Page3(),
        Page4(),
        Page5(),
        Page6(),
        Page7(),
        Page8(),
        Page9(),
      ]),
    );
  }
}
