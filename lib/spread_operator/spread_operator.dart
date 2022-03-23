import 'package:flutter/material.dart';

class MySpreadOperator extends StatefulWidget {
  const MySpreadOperator({Key? key}) : super(key: key);

  @override
  _MySpreadOperatorState createState() => _MySpreadOperatorState();
}

class _MySpreadOperatorState extends State<MySpreadOperator> {
  final items = [Text('Item2'),Text('Item3'),];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MySpreadOperator)')),
      body: Center(child: ListView(
        padding: EdgeInsets.all(12),
        children: [
          Text('Item1'),
          ...items,
          Text('Item4'),
          Column(children: items,)
        ],
      ),),
    );
  }
}