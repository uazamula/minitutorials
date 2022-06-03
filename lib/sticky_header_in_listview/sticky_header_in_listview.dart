import 'package:flutter/material.dart';

class StickyHeaderInListView extends StatefulWidget {
  const StickyHeaderInListView({Key? key}) : super(key: key);

  @override
  _StickyHeaderInListViewState createState() => _StickyHeaderInListViewState();
}

class _StickyHeaderInListViewState extends State<StickyHeaderInListView> {
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
        title: const Text('StickyHeaderInListView)'),
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