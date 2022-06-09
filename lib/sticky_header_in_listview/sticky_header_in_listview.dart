
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

class StickyHeaderInListView extends StatefulWidget {
  const StickyHeaderInListView({Key? key}) : super(key: key);

  @override
  _StickyHeaderInListViewState createState() => _StickyHeaderInListViewState();
}

class _StickyHeaderInListViewState extends State<StickyHeaderInListView> {
  final controller = PageController(initialPage: 0);
  List images = [
    'assets/images/brailka.jpg',
    'assets/images/buddha.jpg',
    'assets/images/explosion.png',
    'assets/images/brailka.jpg',
    'assets/images/buddha.jpg',
  ];

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
          buildListView(),
          buildListViewWithStickyHeaderBuilder(),
          buildListViewWithStickyHeaderBuilderTransparent(),
        ],
      ),
    );
  }

  Widget buildListViewWithStickyHeaderBuilderTransparent() {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) => StickyHeaderBuilder(
        overlapHeaders: true,
        builder: (context, stuckAmount) {
          stuckAmount = 1 - stuckAmount.clamp(0, 1);
          return Container(
            width: double.infinity,
            color: Colors.orange.withOpacity(0.5 + stuckAmount * 0.5),
            padding: EdgeInsets.all(16),
            child: Text('Sticky Header $index'),
          );
        },
        content: Image.asset(
          images[index],
          fit: BoxFit.cover,
          width: double.infinity,
          height: 200,
        ),
      ),
    );
  }

  Widget buildListViewWithStickyHeaderBuilder() {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) => StickyHeaderBuilder(
        builder: (context, stuckAmount) {
          stuckAmount = 1 - stuckAmount.clamp(0, 1);
          return Container(
            width: double.infinity,
            color: Color.lerp(
              Colors.grey,
              Colors.red,
              stuckAmount,
            ),
            padding: EdgeInsets.all(16),
            child: Text('Sticky Header $index'),
          );
        },
        content: Image.asset(
          images[index],
          fit: BoxFit.cover,
          width: double.infinity,
          height: 200,
        ),
      ),
    );
  }

  Widget buildListView() {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) => StickyHeader(
        header: Container(
          width: double.infinity,
          color: Colors.red,
          padding: EdgeInsets.all(16),
          child: Text('Sticky Header $index'),
        ),
        content: Image.asset(
          images[index],
          fit: BoxFit.cover,
          width: double.infinity,
          height: 200,
        ),
      ),
    );
  }
}
