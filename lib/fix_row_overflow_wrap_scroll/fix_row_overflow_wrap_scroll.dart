import 'package:flutter/material.dart';

class FixRowOverflowWrapScroll extends StatefulWidget {
  const FixRowOverflowWrapScroll({Key? key}) : super(key: key);

  @override
  _FixRowOverflowWrapScrollState createState() => _FixRowOverflowWrapScrollState();
}

class _FixRowOverflowWrapScrollState extends State<FixRowOverflowWrapScroll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FixRowOverflowWrapScroll)')),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,

        child: Row(
          children: [
            Container(width: 100,height: 100, color: Colors.red, child: Text('page1')),
            Container(width: 100,height: 100, color: Colors.blue),
            Container(width: 100,height: 100, color: Colors.orange),
            Container(width: 100,height: 100, color: Colors.green),
            Container(width: 100,height: 100, color: Colors.pink),
            Container(width: 100,height: 100, color: Colors.amber),
          ],
        ),
      ),
    );
  }
}