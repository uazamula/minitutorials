import 'package:flutter/material.dart';

class PageViewTemplate extends StatefulWidget {
  const PageViewTemplate({Key? key}) : super(key: key);

  @override
  _PageViewTemplateState createState() => _PageViewTemplateState();
}

class _PageViewTemplateState extends State<PageViewTemplate> {
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
        title: const Text('Page View Template)'),
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
          Container(
            color: Colors.red,
            child: Text('Page 1'),
          ),
        ],
      ),
    );
  }
}