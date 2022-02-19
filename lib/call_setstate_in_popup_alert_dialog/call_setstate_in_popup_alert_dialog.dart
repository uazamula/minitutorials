import 'package:flutter/material.dart';

class HowToCallSetStateInPopUpAlertDialog extends StatefulWidget {
  const HowToCallSetStateInPopUpAlertDialog({Key? key}) : super(key: key);

  @override
  _HowToCallSetStateInPopUpAlertDialogState createState() =>
      _HowToCallSetStateInPopUpAlertDialogState();
}

class _HowToCallSetStateInPopUpAlertDialogState
    extends State<HowToCallSetStateInPopUpAlertDialog> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CallSetStateInPopUpAlertDialog)')),
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
      builder: (context) => StatefulBuilder(builder: (context, setState) {
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
                    this.setState((){});// changes can be seen from alert dialog
                  }),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('SUBMIT'),
                )
              ],
            );
          }));
}
