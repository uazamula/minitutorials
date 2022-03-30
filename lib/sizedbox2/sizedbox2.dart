import 'package:flutter/material.dart';

class SizedBox2 extends StatefulWidget {
  const SizedBox2({Key? key}) : super(key: key);

  @override
  _SizedBox2State createState() => _SizedBox2State();
}

class _SizedBox2State extends State<SizedBox2> {
  final controller = PageController(initialPage: 0);
  int index = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SizedBox2)'),
        actions: [
          IconButton(
              onPressed: () => index != 0
                  ? controller.previousPage(
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOut,
                    )
                  : controller.animateToPage(
                      pages().length - 1,
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOut,
                    ),
              icon: Icon(Icons.arrow_left)),
          IconButton(
              onPressed: index != pages().length - 1
                  ? () {
                      controller.nextPage(
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInOut,
                      );
                    }
                  : null,
              icon: Icon(Icons.arrow_right)),
        ],
      ),
      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            this.index = index;
          });
        },
        children: pages(),
      ),
    );
  }

  List<Widget> pages() {
    return [
      Center(
        child: Row(
          children: [
            Container(color: Colors.red, width: 100, height: 100),
            SizedBox(
              width: 32,
            ),
            Container(
                color: Colors.blue,
                width: 100,
                height: 100,
                child: Text('Page1')),
            SizedBox(
              width: 64,
            ),
            Container(color: Colors.grey, width: 100, height: 100),
          ],
        ),
      ),
      Center(
        child: Column(
          children: [
            Container(color: Colors.red, width: 100, height: 100),
            SizedBox(
              height: 32,
            ),
            Container(
                color: Colors.blue,
                width: 100,
                height: 100,
                child: Text('Page2')),
            SizedBox(
              height: 64,
            ),
            Container(color: Colors.grey, width: 100, height: 100),
          ],
        ),
      ),
      Center(
        child: SizedBox(
            height: 250,
            width: double.infinity,
            child: Container(
                color: Colors.blue,
                width: 100, //ignored in this wrapped Widget by SizedBox
                height: 100, //ignored in this wrapped Widget by SizedBox
                child: Text('Page3'))),
      ),
      Center(
        child: SizedBox.expand(
            child: Container(
                color: Colors.lightGreen,
                width: 100, //ignored in this wrapped Widget by SizedBox
                height: 100, //ignored in this wrapped Widget by SizedBox
                child: Text('Page4'))),
      ),
      Center(
        child: Column(children: [
          Expanded(
            child: SizedBox(
               // height: double.infinity,
                width: double.infinity,
                child: Container(
                    color: Colors.pink,
                    child: Text('Page5'))),
          ),
        ]),
      ),
    ];
  }
}
