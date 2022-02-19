import 'package:flutter/material.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({Key? key}) : super(key: key);

  @override
  _TemplateState createState() => _TemplateState();
}

class _TemplateState extends State<MyPageView> {
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
        title: const Text('Page View)'),
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
        scrollDirection: Axis.vertical,
        onPageChanged: (index) {
          print('Page${index + 1}');
        },
        children: [
          Container(
            color: Colors.red,
            child: Text('Page 1'),
          ),
          Container(
            color: Colors.indigo,
            child: Text('Page 2'),
          ),
          Container(
            color: Colors.green,
            child: Text('Page 3'),
          ),
        ],
      ),
    );
  }
}
