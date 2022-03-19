import 'package:flutter/material.dart';

class ExpandedVsFlexible extends StatefulWidget {
  const ExpandedVsFlexible({Key? key}) : super(key: key);

  @override
  _ExpandedVsFlexibleState createState() => _ExpandedVsFlexibleState();
}

class _ExpandedVsFlexibleState extends State<ExpandedVsFlexible> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ExpandedVsFlexible)')),
      body: Center(),
    );
  }
}