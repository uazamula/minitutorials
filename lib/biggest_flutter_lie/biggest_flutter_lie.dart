import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:minitutorials/biggest_flutter_lie/page.dart';

// flutter_platform_widgets: ^1.20.0
class BiggestFlutterLie extends StatefulWidget {
  const BiggestFlutterLie({Key? key}) : super(key: key);

  @override
  _BiggestFlutterLieState createState() => _BiggestFlutterLieState();
}

class _BiggestFlutterLieState extends State<BiggestFlutterLie> {
  final controller = PageController(initialPage: 0);
  bool switchState = true;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isIOs = (Theme
        .of(context)
        .platform == TargetPlatform.iOS) ||
        (Theme
            .of(context)
            .platform == TargetPlatform.macOS);

    return Scaffold(
      appBar: AppBar(
        title: const Text('BiggestFlutterLie)'),
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
        ],
      ),
      body: PageView(
        // physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          // page 1
          isIOs
              ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text('IOs'),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text('IOs text'),
                buildSwitch(),
                buildSlider(),
                buildBottomNavigationBar(context),
              ],
            ),
          )
              : Scaffold(
            appBar: AppBar(
              title: Text('Android'),
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text('Android text'),
                buildSwitch(),
                buildSlider(),
              ],
            ),
            bottomNavigationBar: buildBottomNavigationBar(context),
          ),
          //page 2
          PlatformScaffold(
            material: (_, __) =>
                MaterialScaffoldData(
                  drawer: Drawer(),
                  floatingActionButton: FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {},
                  ),
                ),
            cupertino: (_, __) => CupertinoPageScaffoldData(),
            appBar: PlatformAppBar(
              material: (_, __) => MaterialAppBarData(),
              cupertino: (_, __) => CupertinoNavigationBarData(),
              title: Text('Platform Widgets'),
              trailingActions: [
                PlatformPopupMenu(
                  options: [
                    PopupMenuOption(label: 'One', onTap: (_) {}),
                    PopupMenuOption(label: 'Two', onTap: (_) {}),
                    PopupMenuOption(label: 'Three', onTap: (_) {}),
                  ],
                  icon: PlatformWidget(
                    material: (_, __) {
                      return Icon(Icons.more_vert_rounded);
                    },
                    cupertino: (_, __) {
                      return Icon(CupertinoIcons.ellipsis);
                    },
                  ),
                )
              ],
            ),
            bottomNavBar: PlatformNavBar(
              currentIndex: 0,
              itemChanged: (index) {},
              items: [
                BottomNavigationBarItem(
                  icon: Icon(PlatformIcons(context).home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(PlatformIcons(context).settings),
                  label: 'Settings',
                ),
              ],
            ),
            body: Center(
              child: PlatformElevatedButton(
                padding: EdgeInsets.all(12),
                child: Text('Elevated Button', style: TextStyle(fontSize: 28),),
                onPressed: () {
                  Navigator.push(context, platformPageRoute(
                      context: context, builder: (context) => MyPage()));
                },
              ),
            ),
          )
          //...
        ],
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(
          icon: Icon(PlatformIcons(context).home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }

  Slider buildSlider() => Slider.adaptive(value: 0.0, onChanged: (value) {});

  Switch buildSwitch() {
    return Switch.adaptive(
        value: switchState,
        onChanged: (value) {
          setState(() {
            switchState = value;
          });
        });
  }
}
