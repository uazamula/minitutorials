import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyWrapWidget extends StatefulWidget {
  const MyWrapWidget({Key? key}) : super(key: key);

  @override
  _MyWrapWidgetState createState() => _MyWrapWidgetState();
}

class _MyWrapWidgetState extends State<MyWrapWidget> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MyWrapWidget)'), actions: [

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

      ],),
      body: PageView(
        controller: controller,
        children: [
          Row(
          children: [
            Container(width: 150,height: 100, color: Colors.red, child: Text('page1')),
            Container(width: 100,height: 100, color: Colors.blue),
            Container(width: 100,height: 100, color: Colors.orange),
            Container(width: 100,height: 100, color: Colors.green),
            Container(width: 100,height: 100, color: Colors.pink),
          ],
        ),

          Wrap(
            spacing: 16,
            runSpacing: 32,
            children: [
              Container(width: 150,height: 100, color: Colors.red, child: Text('page2')),
              Container(width: 100,height: 100, color: Colors.blue),
              Container(width: 100,height: 100, color: Colors.orange),
              Container(width: 100,height: 100, color: Colors.green),
              Container(width: 100,height: 100, color: Colors.pink),
            ],
          ),

          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.end,
              spacing: 16,
              runSpacing: 32,
              children: [
                Container(width: 150,height: 100, color: Colors.red, child: Text('page3')),
                Container(width: 100,height: 100, color: Colors.blue),
                Container(width: 100,height: 100, color: Colors.orange),
                Container(width: 100,height: 100, color: Colors.green),
                Container(width: 100,height: 100, color: Colors.pink),
              ],
            ),
          ),
        ]
      ),
    );
  }
}