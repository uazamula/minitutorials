import 'package:flutter/material.dart';

class MyPopUpDialogWidget extends StatefulWidget {
  const MyPopUpDialogWidget({Key? key}) : super(key: key);

  @override
  _TemplateState createState() => _TemplateState();
}

class _TemplateState extends State<MyPopUpDialogWidget> {
  final lorem = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
      'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
      'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
      'nisi ut aliquip ex ea commodo consequat. '
      'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore '
      'eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, '
      'sunt in culpa qui officia deserunt mollit anim id est laborum.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PopUp Dialog)')),
      body: Center(
        child: ElevatedButton(
          child: Text('Open Dialog'),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('My Title'),
                content: Text(lorem),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('OK')),
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('CANCEL')),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
