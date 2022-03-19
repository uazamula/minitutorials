import 'package:flutter/material.dart';

class MyMediaQuery extends StatefulWidget {
  const MyMediaQuery({Key? key}) : super(key: key);

  @override
  _MyMediaQueryState createState() => _MyMediaQueryState();
}

class _MyMediaQueryState extends State<MyMediaQuery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MyMediaQuery)')),
      body: Center(),
    );
  }
}