import 'package:flutter/material.dart';

class ClipPathBezier extends StatefulWidget {
  const ClipPathBezier({Key? key}) : super(key: key);

  @override
  _ClipPathBezierState createState() => _ClipPathBezierState();
}

class _ClipPathBezierState extends State<ClipPathBezier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ClipPathBezier)')),
      body: Center(),
    );
  }
}