import 'package:flutter/material.dart';
import 'package:minitutorials/flexible_widget/Page1.dart';
import 'package:minitutorials/flexible_widget/Page2.dart';
import 'package:minitutorials/flexible_widget/Page3.dart';
import 'package:minitutorials/flexible_widget/Page4.dart';
import 'package:minitutorials/flexible_widget/Page5.dart';
import 'package:minitutorials/flexible_widget/Page6.dart';
import 'package:minitutorials/flexible_widget/Page7.dart';
import 'package:minitutorials/flexible_widget/Page8.dart';
import 'package:minitutorials/flexible_widget/Page9.dart';

class MyFlexibleWidget extends StatefulWidget {
  const MyFlexibleWidget({Key? key}) : super(key: key);

  @override
  _TemplateState createState() => _TemplateState();
}

class _TemplateState extends State<MyFlexibleWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flexible Widget)')),
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