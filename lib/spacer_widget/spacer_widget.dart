import 'package:flutter/material.dart';
import 'package:minitutorials/spacer_widget/Page1.dart';
import 'package:minitutorials/spacer_widget/Page2.dart';
import 'package:minitutorials/spacer_widget/Page3.dart';
import 'package:minitutorials/spacer_widget/Page4.dart';
import 'package:minitutorials/spacer_widget/Page5.dart';

class MySpacerWidget extends StatefulWidget {
  const MySpacerWidget({Key? key}) : super(key: key);

  @override
  _TemplateState createState() => _TemplateState();
}

class _TemplateState extends State<MySpacerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Spacer Widget)')),
      body: PageView(children: [
        Page1(),
        Page2(),
        Page3(),
        Page4(),
        Page5(),
      ],),
    );
  }
}