import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('App)')),
      body: Container(
        color: Colors.pink,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildPlatformBtnAlertDialog(context),
              buildPlatformBtnModalSheet(context),
              PlatformElevatedButton(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'Date Picker',
                    style: TextStyle(fontSize: 28),
                  ),
                  onPressed: () {
                    showPlatformDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100));
                  }),
            ],
          ),
        ),
      ),
    );
  }

  PlatformElevatedButton buildPlatformBtnModalSheet(BuildContext context) {
    return PlatformElevatedButton(
        padding: EdgeInsets.all(12),
        child: Text(
          'Modal Sheet',
          style: TextStyle(fontSize: 28),
        ),
        onPressed: () {
          showPlatformModalSheet(
            context: context,
            builder: (_) => PlatformWidget(
              material: (_, __) => Column(
                children: [
                  SizedBox(
                    height: 32,
                  ),
                  Text('ModalSheet'),
                ],
              ),
              cupertino: (_, __) => CupertinoActionSheet(
                title: Text('Modal Sheet'),
                message: Text('Description...'),
                cancelButton: CupertinoActionSheetAction(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                actions: [
                  CupertinoActionSheetAction(
                    isDefaultAction: true,
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: Text('Yes'),
                  ),
                  CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: Text('No'),
                  ),
                ],
              ),
            ),
          );
        });
  }

  PlatformElevatedButton buildPlatformBtnAlertDialog(BuildContext context) {
    return PlatformElevatedButton(
      padding: EdgeInsets.all(12),
      child: Text(
        'Alert dialog window',
        style: TextStyle(fontSize: 28),
      ),
      onPressed: () {
        showPlatformDialog(
            context: context,
            builder: (_) => PlatformAlertDialog(
                  title: Text('Alert'),
                  content: Text('Some content'),
                  actions: [
                    PlatformDialogAction(
                      child: PlatformText('Cancel'),
                      onPressed: () => Navigator.pop(context),
                    ),
                    PlatformDialogAction(
                      child: PlatformText('Okay'),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ));
      },
    );
  }
}
