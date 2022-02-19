import 'package:flutter/material.dart';

class MyNullSafety extends StatefulWidget {
  const MyNullSafety({Key? key}) : super(key: key);

  @override
  _MyNullSafetyState createState() => _MyNullSafetyState();
}

class _MyNullSafetyState extends State<MyNullSafety> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MyNullSafety)')),
      body: Container(),
    );
  }
}
