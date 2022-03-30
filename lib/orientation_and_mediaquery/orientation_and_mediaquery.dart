import 'package:flutter/material.dart';

class OrientationAndMediaQuery extends StatefulWidget {
  const OrientationAndMediaQuery({Key? key}) : super(key: key);

  @override
  _OrientationAndMediaQueryState createState() =>
      _OrientationAndMediaQueryState();
}

class _OrientationAndMediaQueryState extends State<OrientationAndMediaQuery> {
  final controller = PageController(initialPage: 1);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    bool isMobile = MediaQuery.of(context).size.shortestSide < 600;
    return Scaffold(
        drawer: isMobile
            ? Drawer(
                child: Container(
                color: Colors.blue,
                width: 300,
                child: Center(
                  child: Text('Sidebar'),
                ),
              ))
            : null,
        appBar: AppBar(
          title: const Text('OrientationAndMediaQuery)'),
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
            isPortrait
                ? Container(
                    color: Colors.blue,
                    child: Center(
                      child: Text('Portrait'),
                    ),
                  ) //portrait
                : Container(
                    color: Colors.green,
                    child: Center(
                      child: Text('Landscape'),
                    ),
                  ), //landscape,
            Row(
              children: [
                if (!isMobile)
                  Container(
                    color: Colors.blue,
                    width: 300,
                    child: Center(
                      child: Text('Sidebar'),
                    ),
                  ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: isPortrait ? 2 : 3,
                    children: List.generate(
                      40,
                      (index) => Card(
                        color: Colors.orange,
                        child: Center(
                          child: Text('Item $index'),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
