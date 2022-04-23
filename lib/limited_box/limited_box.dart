import 'package:flutter/material.dart';

class MyLimitedBox extends StatefulWidget {
  const MyLimitedBox({Key? key}) : super(key: key);

  @override
  _MyLimitedBoxState createState() => _MyLimitedBoxState();
}

class _MyLimitedBoxState extends State<MyLimitedBox> {
  final controller = PageController(initialPage: 0);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text('MyLimitedBox)'),
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
        controller: controller,
        children: [
          buildColumn(),
          buildColumn2(),
          buildLimitedBox(),
          buildColumn3(),
        ],
      ),
    );
  }

  Column buildColumn3() {
    return Column(
          children: [
            Container(
              height: 200,
              child: Container(
                color: Colors.blue,
                height: 2000,
              ),
            ),
          ],
        );
  }

  LimitedBox buildLimitedBox() {
    return LimitedBox(
          maxHeight: 200,//ignored
          child: Container(
            color: Colors.blue,
            height: 2000,//ignored
          ),
        );
  }

  Column buildColumn2() {
    return Column(
          children: [
            LimitedBox(
              maxHeight: 200,
              child: Container(
                color: Colors.blue,
                height: 2000,
              ),
            ),
          ],
        );
  }

  Column buildColumn() {
    return Column(
          children: [
            Container(
              color: Colors.blue,
              height: 2000,
            ),
          ],
        );
  }
}
