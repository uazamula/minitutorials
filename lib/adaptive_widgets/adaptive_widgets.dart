import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAdaptiveWidgets extends StatefulWidget {
  const MyAdaptiveWidgets({Key? key}) : super(key: key);

  @override
  _MyAdaptiveWidgetsState createState() => _MyAdaptiveWidgetsState();
}

class _MyAdaptiveWidgetsState extends State<MyAdaptiveWidgets> {
  bool value = true;
  double valueDouble = 0.7;

  @override
  Widget build(BuildContext context) {
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    return Scaffold(
      appBar: AppBar(title: const Text('MyAdaptiveWidgets)')),
      body: Center(
          child: Column(children: [
        isIOS
            ? CupertinoButton.filled(
                child: Text('iOS Button'),
                onPressed: showAdaptiveDialog,
              )
            : ElevatedButton(
                child: Text('Android Button'),
                onPressed: showAdaptiveDialog,
              ),
        Switch.adaptive(
          //CupertinoSwitch(
          value: value,
          onChanged: (value) => setState(() {
            this.value = value;
          }),
        ),
        SwitchListTile.adaptive(
            title: Text('Title'),
            value: value,
            onChanged: (value) {
              setState(() {
                this.value = value;
              });
            }),
        Slider.adaptive(
            value: valueDouble,
            onChanged: (value) {
              setState(() {
                this.valueDouble = value;
              });
            }),
        CircularProgressIndicator.adaptive(),
            Icon(Icons.adaptive.arrow_back),
            Icon(Icons.adaptive.arrow_forward),
            Icon(Icons.adaptive.share),
            Icon(Icons.adaptive.flip_camera),
            Icon(Icons.adaptive.more),
      ])),
    );
  }

  Future showAdaptiveDialog() async {
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    if (isIOS) {
      showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
                title: Text('Title'),
                content: Text('Body'),
                actions: [
                  CupertinoDialogAction(
                    child: Text('OK'),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ));
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Title'),
                content: Text('Body'),
                actions: [
                  TextButton(
                    child: Text('OK'),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ));
    }
  }
}
