import 'package:flutter/material.dart';

class MyAdaptiveWidgets extends StatefulWidget {
  const MyAdaptiveWidgets({Key? key}) : super(key: key);

  @override
  _MyAdaptiveWidgetsState createState() => _MyAdaptiveWidgetsState();
}

class _MyAdaptiveWidgetsState extends State<MyAdaptiveWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MyAdaptiveWidgets)')),
      body: Center(),
    );
  }
}