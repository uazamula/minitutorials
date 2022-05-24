import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BiggestFlutterLie extends StatefulWidget {
  const BiggestFlutterLie({Key? key}) : super(key: key);

  @override
  _BiggestFlutterLieState createState() => _BiggestFlutterLieState();
}

class _BiggestFlutterLieState extends State<BiggestFlutterLie> {
  final controller = PageController(initialPage: 0);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isIOs = Theme.of(context).platform == TargetPlatform.iOS;

    return Scaffold(
      appBar: AppBar(
        title: const Text('BiggestFlutterLie)'),
        actions: [
          IconButton(
              onPressed: () => controller.previousPage(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  ),
              icon: Icon(Icons.arrow_left)),
          IconButton(
              onPressed: () => controller.nextPage(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  ),
              icon: Icon(Icons.arrow_right)),
        ],
      ),
      body: PageView(
        // physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          isIOs
              ? CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(
                    middle: Text('IOs'),
                  ),
                  child: Container())
              : Scaffold(
                  appBar: AppBar(
                    title: Text('Android'),
                  ),
                  body: Container(),
                ),
        ],
      ),
    );
  }
}
