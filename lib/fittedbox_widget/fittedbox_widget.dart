import 'package:flutter/material.dart';

class MyFittedBoxWidget extends StatefulWidget {
  const MyFittedBoxWidget({Key? key}) : super(key: key);

  @override
  _TemplateState createState() => _TemplateState();
}

class _TemplateState extends State<MyFittedBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fitted Box)')),
      body: Center(
          child: Container(
        color: Colors.green,
        width: 300,//try to change
        height: 200,//try to change to 20

        child: FittedBox( // wrap only Text widget
          fit: BoxFit.scaleDown,//remove to scale Up small fontSize
          child: Text(
            'Flutter',
            style: TextStyle(fontSize: 23),//small fontSize is ignored without this option: fit: BoxFit.scaleDown,
          ),
        ),
      )),
    );
  }
}
