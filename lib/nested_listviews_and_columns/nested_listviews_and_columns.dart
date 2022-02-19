import 'package:flutter/material.dart';

class NestedListViewsAndColumns extends StatefulWidget {
  const NestedListViewsAndColumns({Key? key}) : super(key: key);

  @override
  _NestedListViewsAndColumnsState createState() => _NestedListViewsAndColumnsState();
}

class _NestedListViewsAndColumnsState extends State<NestedListViewsAndColumns> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NestedListViewsAndColumns)')),
      body: Container(),
    );
  }
}