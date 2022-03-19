import 'package:flutter/material.dart';

class MySingleChildScrollView extends StatefulWidget {
  const MySingleChildScrollView({Key? key}) : super(key: key);

  @override
  _MySingleChildScrollViewState createState() =>
      _MySingleChildScrollViewState();
}

class _MySingleChildScrollViewState extends State<MySingleChildScrollView> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MySingleChildScrollView)'),
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
          page1(),
          page2(),
          page3(),
          page4(),
          page5(),
        ],
      ),
    );
  }

  Widget page1() {
    return Column(
      children: [
        Flexible(
            child: Container(
          alignment: Alignment.center,
          color: Colors.red,
          height: 200,
          child: Text('Page1 Item1'),
        )),
        Expanded(
            child: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          height: 500,
          child: Text('Item2'),
        )),
      ],
    );
  }

  Widget page2() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            color: Colors.red,
            height: 200,
            child: Text('Page2 Item1'),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.blue,
            height: 500,
            child: Text('Item2'),
          ),
        ],
      ),
    );
  }

  Widget page3() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            color: Colors.red,
            width: 200,
            child: Text('Page3 Item1'),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 500,
            child: Text('Item2'),
          ),
        ],
      ),
    );
  }

  Widget page4() {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
          ),
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  color: Colors.red,
                  height: 200,
                  child: Text('Page4 Item1'),
                ),
                Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  height: 300,
                  child: Text('Item2'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget page5() {
    return ListView.builder(
      itemCount: 100,
        itemBuilder: (context, index) => Container(
      alignment: Alignment.center,
      height: 200,
      child: Text('Item ${index+1}'),
    ));
  }
}
