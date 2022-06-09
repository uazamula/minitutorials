import 'package:flutter/material.dart';

class HorizontalListView extends StatefulWidget {
  const HorizontalListView({Key? key}) : super(key: key);

  @override
  _HorizontalListViewState createState() => _HorizontalListViewState();
}

class _HorizontalListViewState extends State<HorizontalListView> {
  final controller = PageController(initialPage: 0);
  List<String> images = [
    'assets/images/buddha.jpg',
    'assets/images/brailka.jpg',
    'assets/images/alarm.png',
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
          SingleChildScrollView(
            // doesn't work for Web
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                buildCard(1),
                SizedBox(width: 10),
                buildCard(2),
                SizedBox(width: 10),
                buildCard(3),
                SizedBox(width: 10),
                buildCard(4),
                SizedBox(width: 10),
                buildCard(5),
              ],
            ),
          ),
          ListView(
            // doesn't work for Web
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(12),
            children: [
              buildCard(1),
              SizedBox(width: 10),
              buildCard(2),
              SizedBox(width: 10),
              buildCard(3),
              SizedBox(width: 10),
              buildCard(4),
              SizedBox(width: 10),
              buildCard(5),
            ],
          ),
          ListView.builder(
              // better performance
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(10),
              itemCount: 10,
              itemBuilder: (context, index) {
                return buildCard(index);
              }),
          ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return buildCard(index);
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 16);
            },
            itemCount: 10,
          ),
          SizedBox(
            // doesn't work in PageView
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(12),
              itemBuilder: (context, index) {
                return buildCard(index);
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 16);
              },
              itemCount: 10,
            ),
          ),
          ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return buildImageCard(index);
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 16);
            },
            itemCount: images.length,
          ),
        ],
      ),
    );
  }

  Widget buildImageCard(int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            images[index],
            height: 150,
            width: 150,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 8),
        Text(images[index].substring(14, images[index].length - 4))
      ],
    );
  }

  Widget buildCard(int index) {
    return Container(
      color: Colors.blue,
      width: 150,
      height: 150,
      child: Center(
        child: Text('$index'),
      ),
    );
  }
}
