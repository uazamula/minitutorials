import 'package:flutter/material.dart';

class MyConstrainedBox extends StatefulWidget {
  const MyConstrainedBox({Key? key}) : super(key: key);

  @override
  _MyConstrainedBoxState createState() => _MyConstrainedBoxState();
}

class _MyConstrainedBoxState extends State<MyConstrainedBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MyConstrainedBox)')),
      body: Center(),
    );
  }
}
