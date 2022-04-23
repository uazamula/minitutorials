import 'package:flutter/material.dart';

class NullAware extends StatefulWidget {
  const NullAware({Key? key}) : super(key: key);

  @override
  _NullAwareState createState() => _NullAwareState();
}

class _NullAwareState extends State<NullAware> {
  String? var1 =null;
  String? var2 ='var2';
  String? var3;
  String? var4;
  String? var5='var5';
  List<int>? listnull;
  List<int>? listnotnull=[1,2];

  @override
  Widget build(BuildContext context) {
    var4??=var2;
    var5??=var2;
    return Scaffold(
      appBar: AppBar(title: const Text('NullAware)')),
      body: Center(
        child: Column(
          children: [
            Text('var2='+var2!),
            // Text(var3!),//runtime error
            // Text(var3?.toLowerCase()),//compile error
            Text('var3='+ (var3??'Other value')),
            Text('var4='+ var4!),
            Text('var5='+ var5!),
            Text('listnull='+ [...?listnull,3].toString()),
            Text('listnotnull='+ [...?listnotnull,3].toString()),

          ],
        ),
      ),
    );
  }
}
