import 'package:flutter/material.dart';

class MySpreadOperator extends StatefulWidget {
  const MySpreadOperator({Key? key}) : super(key: key);

  @override
  _MySpreadOperatorState createState() => _MySpreadOperatorState();
}

class _MySpreadOperatorState extends State<MySpreadOperator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MySpreadOperator)')),
      body: Center(),
    );
  }
}