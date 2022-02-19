import 'package:flutter/material.dart';

class MyStepperWidget extends StatefulWidget {
  const MyStepperWidget({Key? key}) : super(key: key);

  @override
  _MyStepperWidgetState createState() => _MyStepperWidgetState();
}

class _MyStepperWidgetState extends State<MyStepperWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MyStepperWidget)')),
      body: Container(),
    );
  }
}