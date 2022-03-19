import 'package:flutter/material.dart';

class CollectionIfFor extends StatefulWidget {
  const CollectionIfFor({Key? key}) : super(key: key);

  @override
  _CollectionIfForState createState() => _CollectionIfForState();
}

class _CollectionIfForState extends State<CollectionIfFor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CollectionIfFor)')),
      body: Center(),
    );
  }
}