import 'package:flutter/material.dart';

class WillPopScopePage2 extends StatefulWidget {
  const WillPopScopePage2({Key? key}) : super(key: key);

  @override
  State<WillPopScopePage2> createState() => _WillPopScopePage2State();
}

class _WillPopScopePage2State extends State<WillPopScopePage2> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // return false;//stay on page
        // return true;//pop page
        final shouldPop = await showMyDialog();
        return shouldPop ?? false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Page2'),
        ),
        body: const Center(child: Text('Page2')),
      ),
    );
  }

  Future<bool?> showMyDialog() async {
    return showDialog<bool?>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Do you want to go BACK?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('CANCEL')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text('YES'))
            ],
          );
        });
  }
}
