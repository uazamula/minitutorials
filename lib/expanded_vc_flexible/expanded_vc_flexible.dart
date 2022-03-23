import 'package:flutter/material.dart';

class ExpandedVsFlexible extends StatefulWidget {
  const ExpandedVsFlexible({Key? key}) : super(key: key);

  @override
  _ExpandedVsFlexibleState createState() => _ExpandedVsFlexibleState();
}

class _ExpandedVsFlexibleState extends State<ExpandedVsFlexible> {
  final controller = PageController(initialPage: 1);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ExpandedVsFlexible)'),
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
      ],),
      body: PageView(
        controller: controller,
        children: [

          Column(
            children: [
              Container(
                height: 200,
                color: Colors.red,
                child: Text('Page 1\n200'),
              ),
              Container(
                height: 50,
                color: Colors.indigo,
                child: Text('Page 1\n50'),
              ),],
          ),

          Column(
            children: [
              Container(
                height: 200,
                color: Colors.green,
                child: Text('Page 2\n200'),
              ),
              Expanded(
                child: Container(
                  height: 200,//ignored
                  color: Colors.amber,
                  child: Text('Page 2\nExpanded'),
                ),
              ),],
          ),

          Column(
            children: [
              Container(
                height: 200,
                color: Colors.green,
                child: Text('Page 3\n200'),
              ),
              Flexible(
                child: Container(
                  height: 50,//ignored
                  color: Colors.amber,
                  child: Text('Page 3\nFlexible'),
                ),
              ),],
          ),

          Column(
            children: [
              Container(
                height: 200,
                color: Colors.green,
                child: Text('Page 4\n200'),
              ),
              Expanded(
                child: Container(
                  height: 200,//ignored//as much as Flexible + empty space
                  color: Colors.amber,
                  child: Text('Page 4\nExpanded\n as much as Flexible +empty space'),
                ),
              ),
              Flexible(
                child: Container(
                  height: 100,//100 or less
                  color: Colors.pink,
                  child: Text('Page 4\nFlexible\n 100 or less'),
                ),
              ),],
          ),

      ],),
    );
  }
}