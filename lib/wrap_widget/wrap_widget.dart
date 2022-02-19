import 'package:flutter/material.dart';

class MyWrapWidget extends StatefulWidget {
  const MyWrapWidget({Key? key}) : super(key: key);

  @override
  _MyWrapWidgetState createState() => _MyWrapWidgetState();
}

class _MyWrapWidgetState extends State<MyWrapWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MyWrapWidget)')),
      body: Container(),
    );
  }
}