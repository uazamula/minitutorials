import 'package:flutter/material.dart';

class AppWithSeparateDialogWidget extends StatefulWidget {
  const AppWithSeparateDialogWidget({Key? key}) : super(key: key);

  @override
  _AppWithSeparateDialogWidgetState createState() =>
      _AppWithSeparateDialogWidgetState();
}

class _AppWithSeparateDialogWidgetState
    extends State<AppWithSeparateDialogWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SeparateDialogStatefulWidget)')),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                  'CheckBox',
                  style: TextStyle(fontSize: 24),
                )),
                Transform.scale(
                  scale: 2,
                  child: Checkbox(
                    value: isChecked,
                    onChanged: null,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              child: Text('Open Dialog'),
              onPressed: () async {
                await openDialog();
                setState(() {
                  // isChecked=isChecked;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => DialogWidget(
          isChecked: isChecked,
          onChangedCheck: (isChecked) => setState(() {
            this.isChecked = isChecked;
          }),
        ),
      );
}

class DialogWidget extends StatefulWidget {
  final bool isChecked;
  final ValueChanged<bool> onChangedCheck;

  const DialogWidget(
      {Key? key, required this.isChecked, required this.onChangedCheck})
      : super(key: key);

  @override
  _DialogWidgetState createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    this.isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('SetState in Dialog?'),
      content: CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(
            isChecked ? 'Yes' : 'No',
            style: TextStyle(fontSize: 24),
          ),
          value: isChecked,
          onChanged: (isChecked) {
            setState(() {
              this.isChecked = isChecked!;
            });
            //this.setState((){});// changes can be seen from alert dialog
          }),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            widget.onChangedCheck(isChecked);
          },
          child: Text('SUBMIT'),
        )
      ],
    );
  }
}
