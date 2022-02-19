import 'package:flutter/material.dart';
import 'package:minitutorials/WillPopScopeMy/will_pop_scope_page2.dart';

class WillPopScopePage1 extends StatefulWidget {
  const WillPopScopePage1({Key? key}) : super(key: key);

  @override
  State<WillPopScopePage1> createState() => _WillPopScopePage1State();
}

class _WillPopScopePage1State extends State<WillPopScopePage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page1'),
      ),
      body:  Center(
          child: TextButton(
        child: const Text('Page1'),
        style: TextButton.styleFrom(backgroundColor: Colors.grey[200]),
        onPressed: (){
           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const WillPopScopePage2()));
        },
      )),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
