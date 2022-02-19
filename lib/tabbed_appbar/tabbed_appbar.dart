import 'package:flutter/material.dart';

class MyTabbedAppBar extends StatefulWidget {
  const MyTabbedAppBar({Key? key}) : super(key: key);

  @override
  _TemplateState createState() => _TemplateState();
}

class _TemplateState extends State<MyTabbedAppBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(title: const Text('Tabbed AppBar)'),
        bottom: const TabBar(
          tabs:[
            Tab(text:'Tab1',icon: Icon(Icons.home),),
            Tab(text:'Tab2',icon: Icon(Icons.email),),
            Tab(text:'Tab3',icon: Icon(Icons.person),),

          ]
        ),),
        body: const TabBarView(children: [
          Center(child: Text('Page1'),),
          Center(child: Text('Page2'),),
          Center(child: Text('Page3'),),
        ],),
      ),
    );
  }
}