import 'package:flutter/material.dart';

class MyDragAndDrop extends StatefulWidget {
  const MyDragAndDrop({Key? key}) : super(key: key);

  @override
  _MyDragAndDropState createState() => _MyDragAndDropState();
}

class _MyDragAndDropState extends State<MyDragAndDrop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MyDragAndDrop)')),
      body: Container(),
    );
  }
}