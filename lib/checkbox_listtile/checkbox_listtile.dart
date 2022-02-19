import 'package:flutter/material.dart';

class MyCheckBoxListTile extends StatefulWidget {
  const MyCheckBoxListTile({Key? key}) : super(key: key);

  @override
  _MyCheckBoxListTileState createState() => _MyCheckBoxListTileState();
}

class _MyCheckBoxListTileState extends State<MyCheckBoxListTile> {
  bool isChecked =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('App)')),
      body: Center(child: Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: Colors.red,
        ),
        child: CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: const Text('My CheckBox'),
          subtitle: const Text('My Subtitle'),
          value: isChecked,
          onChanged: (value){
            setState(() {
              isChecked =value!;
            });
          },
          activeColor: Colors.red,
          checkColor: Colors.white,
        ),
      ),),
    );
  }
}
