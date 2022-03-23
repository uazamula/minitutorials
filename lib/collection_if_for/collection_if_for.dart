import 'package:flutter/material.dart';

class CollectionIfFor extends StatefulWidget {
  const CollectionIfFor({Key? key}) : super(key: key);

  @override
  _CollectionIfForState createState() => _CollectionIfForState();
}

class _CollectionIfForState extends State<CollectionIfFor> {
  bool hasGreen = false;
  final items=['Item A','Item B','Item C',];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CollectionIfFor)')),
      body: ListView(children: [
        Container(color: Colors.red,height: 100),
        if(hasGreen)
          Container(color: Colors.green, height: 100),
        for(int i=1;i<10;i++ )
          Text('Item$i'),
        Text('is working?'),
        for(var item in items)
          Text(item.toUpperCase())
      ],),
    );
  }
}