import 'package:flutter/material.dart';

class CreatePopUpDialogWithTextField extends StatefulWidget {
  const CreatePopUpDialogWithTextField({Key? key}) : super(key: key);

  @override
  _CreatePopUpDialogWithTextFieldState createState() =>
      _CreatePopUpDialogWithTextFieldState();
}

class _CreatePopUpDialogWithTextFieldState
    extends State<CreatePopUpDialogWithTextField> {
  late TextEditingController controller;
  String name = '';

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CreatePopUpDialogWithTextField)')),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            children: [
              Text(name),
              ElevatedButton(
                child: Text('Open Dialog'),
                onPressed: () async {
                  final String? name = await openDialog();
                  if (name == null || name.isEmpty) return;
                  setState(() {
                    this.name = name;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('Your Name'),
            content: TextField(
                autofocus: true,
                decoration: InputDecoration(hintText: 'Enter your name'),
                controller: controller,
                onSubmitted: (_) {
                  Navigator.of(context).pop(controller.text);
                  controller.clear();
                }),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(controller.text);
                  controller.clear();
                },
                child: Text('SUBMIT'),
              )
            ],
          ));
}
