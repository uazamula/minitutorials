import 'package:flutter/material.dart';

class MyMediaQuery extends StatefulWidget {
  const MyMediaQuery({Key? key}) : super(key: key);

  @override
  _MyMediaQueryState createState() => _MyMediaQueryState();
}

class _MyMediaQueryState extends State<MyMediaQuery> {
  final controller = PageController(initialPage: 1);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isDesktop(BuildContext context) => screenWidth >= 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('MyMediaQuery)'),
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
      body: PageView(controller: controller, children: [
        Center(
          child: Text('$screenWidth  $screenHeight'),
        ),
        Row(
          children: [
            if (isDesktop(context))
              Container(
                color: Colors.blue,
                width: 200,
                child: Center(
                  child: Text('SIDEBAR'),
                ),
              ),
            Expanded(
              child: Container(
                color: Colors.red,
                width: 200,
                child: Center(
                  child: Text('CONTENT'),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
