import 'package:flutter/material.dart';

class HorizontalListView extends StatefulWidget {
  const HorizontalListView({Key? key}) : super(key: key);

  @override
  _HorizontalListViewState createState() => _HorizontalListViewState();
}

class _HorizontalListViewState extends State<HorizontalListView> {
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
        title: const Text('HorizontalListView)'),
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