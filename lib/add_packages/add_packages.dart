import 'package:flutter/material.dart';

class MyAddPackages extends StatefulWidget {
  const MyAddPackages({Key? key}) : super(key: key);

  @override
  _MyAddPackagesState createState() => _MyAddPackagesState();
}

class _MyAddPackagesState extends State<MyAddPackages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MyAddPackages)')),
      body: Column(children: [
        Container(
          height: 150,
          color: Colors.red,
          child: Center(child: Text('Some Widgets'),),
        ),
        ListView.builder(itemCount: 3,itemBuilder: (context,index)=>ListTile(
          
        ))
      ],),
    );
  }
}
