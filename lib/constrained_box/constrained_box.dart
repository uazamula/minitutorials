import 'package:flutter/material.dart';

class MyConstrainedBox extends StatefulWidget {
  const MyConstrainedBox({Key? key}) : super(key: key);

  @override
  _MyConstrainedBoxState createState() => _MyConstrainedBoxState();
}

class _MyConstrainedBoxState extends State<MyConstrainedBox> {
  final controller = PageController(initialPage: 1);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyConstrainedBox)'),
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
          buildCenter(),
          buildCenter2(),
          buildCenter3(),
          buildCenter4(),
          buildCenter5(),
          buildCenter6(),
          buildCenter7(),
        ],
      ),
    );
  }

  Widget buildCenter7() {
    return ListView(
          children: [ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 300,//tight constraint
              maxWidth: 300,//tight constraint
              minHeight: 100,//this value will be taken (if ListView)
              maxHeight: double.infinity, //this value will be taken (if Center)
            ),
            child: Container(
              color: Colors.red,
            ),
          )],
        );
  }

  Center buildCenter6() {
    return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 200,
              maxWidth: 300,//this value will be taken
              minHeight: 200,
              maxHeight: 300,//this value will be taken
            ),
            child: Container(
              color: Colors.red,
            ),
          ),
        );
  }

  Center buildCenter5() {
    return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 200,
              maxWidth: 300,
              minHeight: 200,
              maxHeight: 300,
            ),
            child: Container(
              color: Colors.red,
              width: 250, //250
              height: 250, //250
            ),
          ),
        );
  }

  Center buildCenter4() {
    return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 200,
              maxWidth: 300,
              minHeight: 200,
              maxHeight: 300,
            ),
            child: Container(
              color: Colors.red,
              width: 100, //200
              height: 100, //200
            ),
          ),
        );
  }

  Center buildCenter3() {
    return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 200,
              maxWidth: 300,
              minHeight: 200,
              maxHeight: 300,
            ),
            child: Container(
              color: Colors.red,
              width: 500, //300
              height: 500, //300
            ),
          ),
        );
  }

  Center buildCenter2() {
    return Center(
      child: SizedBox(
        width: 200,
        height: 200,
        child: Container(
          color: Colors.red,
          width: 500, //ignored
          height: 500, //ignored
        ),
      ),
    );
  }

  Center buildCenter() {
    return Center(
      child: SizedBox(
        width: 200,
        height: 200,
        child: FlutterLogo(),
      ),
    );
  }
}
