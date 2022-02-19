import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class MyUniqueIdentifierGenerator extends StatefulWidget {
  const MyUniqueIdentifierGenerator({Key? key}) : super(key: key);

  @override
  _TemplateState createState() => _TemplateState();
}

class _TemplateState extends State<MyUniqueIdentifierGenerator> {
  String id = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Unique Identifier generator)')),
      body: Center(
        child: Column(
          children: [
            ListTile(
              title: Text('UUID'),
              subtitle: Text(id),
            ),
          SizedBox(height: 32,),
          ElevatedButton(onPressed: (){
            setState(() {
              const uuid = Uuid();
              // id=uuid.v1();// time-based id
              id = uuid.v5(Uuid.NAMESPACE_URL,'www.flutter.dev');

            });

          }, child: Text('Generate IDs'))],
        ),
      ),
    );
  }
}
