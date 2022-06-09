import 'package:flutter/material.dart';

class Top10Widgets extends StatefulWidget {
  const Top10Widgets({Key? key}) : super(key: key);
  static const loremShort =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
      'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ';
  static const lorem =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
      'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
      'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
      'nisi ut aliquip ex ea commodo consequat. '
      'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore '
      'eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, '
      'sunt in culpa qui officia deserunt mollit anim id est laborum.';

  @override
  _Top10WidgetsState createState() => _Top10WidgetsState();
}

class _Top10WidgetsState extends State<Top10Widgets> {
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
        title: const Text('Top10Widgets)'),
        actions: [
          IconButton(
              onPressed: () =>
                  controller.previousPage(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  ),
              icon: Icon(Icons.arrow_left)),
          IconButton(
              onPressed: () =>
                  controller.nextPage(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  ),
              icon: Icon(Icons.arrow_right)),
          IconButton(
              onPressed: () => controller.jumpToPage(pages().length - 1),
              icon: Icon(Icons.arrow_downward_sharp)),
        ],
      ),
      body: PageView(
        // physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: pages(),
      ),
    );
  }

  List<Widget> pages() {
    return [
      buildNonIntrinsicHeight(),
      buildIntrinsicHeight(),
      buildNonIntrinsicWidth(),
      buildIntrinsicWidth(),
      buildRowNonWrap(),
      buildWrap(),
      buildWrapAlignment(),
      buildSpacer(),
      buildSpacers(),
      buildSpacerAndAlignment(),
      buildWithoutFittedBox(),
      buildFittedBox(),
      buildFittedBoxScaleDown(),
      buildWithoutExpanded(),
      buildExpanded(),
      buildTwoExpanded(),
      buildTwoExpandedFlex(),
      buildFlexible(),
      buildTwoFlexible1(),
      buildTwoFlexible2(),
      buildTwoFlexibleImg(),
      buildMediaQuery(),
      buildMediaQuerySideBar(),
      buildOrientation(),
      buildOrientationManyStuff(),
      buildLayoutBuilder(),
    ];
  }

  Scaffold buildLayoutBuilder() {
    return Scaffold(
      appBar: AppBar(
        title: Text("2. LayoutBuilder"),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        final width = constraints.maxWidth;
        final heightLayoutBuilder = constraints.maxHeight;
        final heightMediaQuery = MediaQuery
            .of(context)
            .size
            .height;
        return Container(color: Colors.orange,
          child: Center(child: Text(
            'w: $width, h(LayoutBuilder - without appBars): $heightLayoutBuilder,'
                ' h(MediaQuery): $heightMediaQuery',),),);
      },),
    );
  }

  Scaffold buildOrientationManyStuff() {
    final isMobile = MediaQuery
        .of(context)
        .size
        .shortestSide < 600;
    final isPortrait =
        MediaQuery
            .of(context)
            .orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: Text("3. Orientation"),
      ),
      body: Row(
        children: [
          if (!isMobile) buildSidebarFor4('Sidebar in tablet/web'),
          Expanded(
            child: GridView.count(
              crossAxisCount: isPortrait ? 2 : 3,
              children: List.generate(
                  40,
                      (index) =>
                      Card(
                        color: Colors.orange,
                        child: Center(child: Text('Item $index')),
                      )),
            ),
          ),
        ],
      ),
      drawer: isMobile ? Drawer(child: buildSidebarFor4('Sidebar')) : null,
    );
  }

  Container buildSidebarFor4(String text) {
    return Container(
      color: Colors.blue,
      width: 300,
      child: Center(child: Text(text)),
    );
  }

  Scaffold buildOrientation() {
    return Scaffold(
      appBar: AppBar(
        title: Text("3. Orientation"),
      ),
      body: MediaQuery
          .of(context)
          .orientation == Orientation.portrait
          ? Center(
        child: Text('Portrait', style: TextStyle(fontSize: 20)),
      )
          : Center(
        child: Text('Landscape', style: TextStyle(fontSize: 20)),
      ),
    );
  }

  Scaffold buildMediaQuerySideBar() {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    bool isLarge = screenWidth >= 600;
    return Scaffold(
      appBar: AppBar(
        title: Text("4. MediaQuery Sidebar"),
      ),
      body: Row(
        children: [
          if (isLarge)
            Container(
              color: Colors.blue,
              width: 200,
              child: Center(
                  child: Text('SIDEBAR', style: TextStyle(fontSize: 20))),
            ),
          Expanded(
            child: Container(
              color: Colors.red,
              width: 200,
              child: Text(
                  'Content. ${isLarge ? 'Decrease' : 'Increase'} the width',
                  style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }

  Scaffold buildMediaQuery() {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      appBar: AppBar(
        title: Text("4. MediaQuery"),
      ),
      body: Center(
        child: Text(
            'screen width = $screenWidth\nscreen height = $screenHeight',
            style: TextStyle(fontSize: 20)),
      ),
    );
  }

  Scaffold buildTwoFlexibleImg() {
    return Scaffold(
      appBar: AppBar(
        title: Text("5. Flexible image"),
      ),
      body: Column(
        children: [
          Flexible(child: LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxHeight < 200) {
              return ElevatedButton(onPressed: () {}, child: Text('See Img'));
            } else {
              return Image.asset(
                'assets/images/brailka.jpg',
                height: 400,
                width: double.infinity,
                fit: BoxFit.cover,
              );
            }
          })),
          Container(
            height: 200,
            color: Colors.blue,
            child: Center(
                child: Text('More widgets', style: TextStyle(fontSize: 40))),
          ),
        ],
      ),
    );
  }

  Scaffold buildTwoFlexible2() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "5.TwoFlexible(flex values ignored, if Widgets doesn't fill parent area"
                " (but flex values count as priority)"),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              color: Colors.orange,
              height: 100,
              child: Center(
                  child: Text('2/3, <=100', style: TextStyle(fontSize: 40))),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              height: 400,
              color: Colors.green,
              child: Center(
                  child: Text('1/3, <=400', style: TextStyle(fontSize: 40))),
            ),
          ),
          Container(
            height: 50,
            color: Colors.blue,
            child: Center(child: Text('50', style: TextStyle(fontSize: 40))),
          ),
        ],
      ),
    );
  }

  Scaffold buildTwoFlexible1() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "5.TwoFlexible(flex values ignored, if Widgets doesn't fill parent area"
                " (but flex values count as priority)"),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              color: Colors.orange,
              height: 100,
              child: Center(
                  child: Text('2/3, <=100', style: TextStyle(fontSize: 40))),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              height: 400,
              color: Colors.green,
              child: Center(
                  child: Text('1/3, <=400', style: TextStyle(fontSize: 40))),
            ),
          ),
          Container(
            height: 200,
            color: Colors.blue,
            child: Center(child: Text('200', style: TextStyle(fontSize: 40))),
          ),
        ],
      ),
    );
  }

  Scaffold buildFlexible() {
    return Scaffold(
      appBar: AppBar(
        title: Text("5.Flexible"),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.orange,
            height: 100,
            child: Center(child: Text('100', style: TextStyle(fontSize: 40))),
          ),
          Flexible(
            child: Container(
              height: 400,
              color: Colors.green,
              child: Center(
                  child:
                  Text('Flexible(<=400)', style: TextStyle(fontSize: 40))),
            ),
          ),
          Container(
            height: 300,
            color: Colors.blue,
            child: Center(child: Text('300', style: TextStyle(fontSize: 40))),
          ),
        ],
      ),
    );
  }

  Scaffold buildTwoExpandedFlex() {
    return Scaffold(
      appBar: AppBar(
        title: Text("6.Two Expanded with diff flex"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.green,
              child:
              Center(child: Text('flex=1', style: TextStyle(fontSize: 40))),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.orange,
              child:
              Center(child: Text('flex=2', style: TextStyle(fontSize: 40))),
            ),
          ),
        ],
      ),
    );
  }

  Scaffold buildTwoExpanded() {
    return Scaffold(
      appBar: AppBar(
        title: Text("6.Two Expanded"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: 200,
              color: Colors.green,
              child: Center(
                  child: Text('200 ignored', style: TextStyle(fontSize: 40))),
            ),
          ),
          Expanded(
            child: Container(
              height: 150,
              color: Colors.orange,
              child: Center(
                  child: Text('150 ignored', style: TextStyle(fontSize: 40))),
            ),
          ),
        ],
      ),
    );
  }

  Scaffold buildExpanded() {
    return Scaffold(
      appBar: AppBar(
        title: Text("6.Expanded"),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            color: Colors.green,
            child: Center(child: Text('200', style: TextStyle(fontSize: 50))),
          ),
          Expanded(
            child: Container(
              height: 150, //ignored
              color: Colors.orange,
              child: Center(
                  child: Text('150 ignored', style: TextStyle(fontSize: 50))),
            ),
          ),
        ],
      ),
    );
  }

  Scaffold buildWithoutExpanded() {
    return Scaffold(
      appBar: AppBar(
        title: Text("6.without Expanded"),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            color: Colors.green,
            child: Center(child: Text('200', style: TextStyle(fontSize: 50))),
          ),
          Container(
            height: 150,
            color: Colors.orange,
            child: Center(child: Text('150', style: TextStyle(fontSize: 50))),
          ),
        ],
      ),
    );
  }

  Scaffold buildFittedBoxScaleDown() {
    return Scaffold(
      appBar: AppBar(
        title: Text("7.Fitted Box and BoxFit.scaleDown"),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 200,
          color: Colors.green,
          child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Flutter',
                style: TextStyle(fontSize: 30),
              )),
        ),
      ),
    );
  }

  Scaffold buildFittedBox() {
    return Scaffold(
      appBar: AppBar(
        title: Text("7.Fitted Box"),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 200,
          color: Colors.green,
          child: FittedBox(
              child: Text(
                'Flutter',
                style: TextStyle(fontSize: 300),
              )),
        ),
      ),
    );
  }

  Scaffold buildWithoutFittedBox() {
    return Scaffold(
      appBar: AppBar(
        title: Text("7.without Fitted Box"),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 200,
          color: Colors.green,
          child: Text('Flutter', style: TextStyle(fontSize: 300)),
        ),
      ),
    );
  }

  Scaffold buildSpacerAndAlignment() {
    return Scaffold(
      appBar: AppBar(
        title: Text('8.Alignment doesn\'t matter with Spacer'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(height: 100, color: Colors.red),
          Container(height: 100, color: Colors.blue),
          Container(height: 100, color: Colors.green),
          Spacer(), // flexible size
        ],
      ),
    );
  }

  Scaffold buildSpacers() {
    return Scaffold(
      appBar: AppBar(
        title: Text('8.Two Spacer Widgets'),
      ),
      body: Column(
        children: [
          Container(height: 100, color: Colors.red),
          Spacer(flex: 1), // flexible size
          Container(height: 100, color: Colors.blue),
          Spacer(
            flex: 2,
          ), // flexible size
          Container(height: 100, color: Colors.green),
        ],
      ),
    );
  }

  Scaffold buildSpacer() {
    return Scaffold(
      appBar: AppBar(
        title: Text('8.SizedBox & Spacer Widgets'),
      ),
      body: Column(
        children: [
          Container(height: 100, color: Colors.red),
          SizedBox(height: 50), //fixed size
          Container(height: 100, color: Colors.blue),
          Spacer(), // flexible size
          Container(height: 100, color: Colors.green),
        ],
      ),
    );
  }

  Scaffold buildWrapAlignment() {
    return Scaffold(
      appBar: AppBar(
        title: Text('9.Wrap Widget with Alignment'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Wrap(
          alignment: WrapAlignment.end,
          spacing: 32,
          runSpacing: 64,
          children: [
            Container(width: 200, height: 100, color: Colors.red),
            Container(width: 200, height: 100, color: Colors.blue),
            Container(width: 200, height: 100, color: Colors.green),
            Container(width: 200, height: 100, color: Colors.orange),
            Container(width: 200, height: 100, color: Colors.pink),
          ],
        ),
      ),
    );
  }

  Scaffold buildWrap() {
    return Scaffold(
      appBar: AppBar(
        title: Text('9.Wrap Widget'),
      ),
      body: Wrap(
        spacing: 32,
        runSpacing: 64,
        children: [
          Container(width: 200, height: 100, color: Colors.red),
          Container(width: 200, height: 100, color: Colors.blue),
          Container(width: 200, height: 100, color: Colors.green),
          Container(width: 200, height: 100, color: Colors.orange),
          Container(width: 200, height: 100, color: Colors.pink),
        ],
      ),
    );
  }

  Scaffold buildRowNonWrap() {
    return Scaffold(
      appBar: AppBar(
        title: Text('9.Row Widget'),
      ),
      body: Row(
        children: [
          Container(width: 200, height: 100, color: Colors.red),
          Container(width: 200, height: 100, color: Colors.blue),
          Container(width: 200, height: 100, color: Colors.green),
          Container(width: 200, height: 100, color: Colors.orange),
          Container(width: 200, height: 100, color: Colors.pink),
        ],
      ),
    );
  }

  Scaffold buildNonIntrinsicHeight() {
    return Scaffold(
      appBar: AppBar(
        title: Text('10.NonIntrinsic Height'),
      ),
      body: Card(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Image.asset(
                'assets/images/buddha.jpg',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
                flex: 3,
                child: Text(
                  Top10Widgets.lorem,
                  style: TextStyle(fontSize: 18),
                ))
          ],
        ),
      ),
    );
  }

  Scaffold buildIntrinsicHeight() {
    return Scaffold(
      appBar: AppBar(
        title: Text('10.Intrinsic Height'),
      ),
      body: Card(
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch, // add it here
            children: [
              Expanded(
                flex: 2,
                child: Image.asset(
                  'assets/images/buddha.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                  flex: 3,
                  child: Text(
                    Top10Widgets.lorem,
                    style: TextStyle(fontSize: 18),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Scaffold buildNonIntrinsicWidth() {
    return Scaffold(
      appBar: AppBar(
        title: Text('10.NonIntrinsic Width'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,// add it here
          children: [
            Container(
              height: 50,
              width: 150,
              color: Colors.blue,
            ),
            Container(
              height: 50,
              width: 100,
              color: Colors.red,
            ),
            Container(
              height: 50,
              width: 50,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  Scaffold buildIntrinsicWidth() {
    return Scaffold(
      appBar: AppBar(
        title: Text('10.Intrinsic Width'),
      ),
      body: Center(
        child: IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch, // add it here
            children: [
              Container(
                height: 50,
                width: 150,
                color: Colors.blue,
              ),
              Container(
                height: 50,
                width: 100,
                color: Colors.red,
              ),
              Container(
                height: 50,
                width: 50,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
