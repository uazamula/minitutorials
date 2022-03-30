import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyFractionallySizedBox extends StatefulWidget {
  const MyFractionallySizedBox({Key? key}) : super(key: key);

  @override
  _MyFractionallySizedBoxState createState() => _MyFractionallySizedBoxState();
}

class _MyFractionallySizedBoxState extends State<MyFractionallySizedBox> {
  final controller = PageController(initialPage: 0);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyFractionallySizedBox)'),
        actions: actions(),
      ),
      body: PageView(
        controller: controller,
        children: pages(),
      ),
    );
  }

  List<Widget> pages() => [
    Center(
        child: FractionallySizedBox(
          widthFactor: 0.7,
          child: Container(
              color: Colors.blue,
              width: 100,//ignored
              height: 80,
              child: Text(' Page1,\n 70% w')),
        )),

    Center(
        child: FractionallySizedBox(
          heightFactor: 0.9,
          child: Container(
              color: Colors.green,
              width: 100,
              height: 80,//ignored
              child: Text(' Page2,  \n 90% h')),
        )),

    Center(
        child: Container(
          width: 400,
          height: 200,
          color: Colors.green.withOpacity(0.3),
          child: FractionallySizedBox(
            heightFactor: 0.6,
            child: Container(
                color: Colors.green,
                width: 100,//ignored by "grand parent" Container
                height: 80,//ignored by FractionallySizedBox
                child: Text(' Page3,  \n 60% h inside Container')),
          ),
        )),

    Center(
        child: Container(
          width: 400,
          height: 200,
          color: Colors.green.withOpacity(0.3),
          child: FractionallySizedBox(
            alignment: Alignment.bottomLeft,
            widthFactor: 0.9,
            heightFactor: 0.6,
            child: Container(
                color: Colors.green,
                width: 100,//ignored by FractionallySizedBox
                height: 80,//ignored by FractionallySizedBox
                child: Text(' Page4,  \n 60% h & 90% w inside Container & bottomLeft alignment')),
          ),
        )),

    Column(
      children: [
        Flexible(
          child: FractionallySizedBox(
            widthFactor: 0.9,
            heightFactor: 0.6,
            child: Container(
                color: Colors.green,
                child: Text(' Page5,  \n 60% h as Flexible from unused height by blue Container & 90% w')),
          ),
        ),
        Container(color: Colors.blue,width: 300,height: 300,)
      ],
    ),
      ];

  List<Widget> actions() {
    return [
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
    ];
  }
}
