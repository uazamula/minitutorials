import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ExpandCollapseWidget extends StatefulWidget {
  const ExpandCollapseWidget({Key? key}) : super(key: key);

  @override
  _ExpandCollapseWidgetState createState() => _ExpandCollapseWidgetState();
}

class _ExpandCollapseWidgetState extends State<ExpandCollapseWidget> {
  final String lorem =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
      'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
      'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
      'nisi ut aliquip ex ea commodo consequat. '
      'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore '
      'eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, '
      'sunt in culpa qui officia deserunt mollit anim id est laborum.';
  late ExpandableController controller;

  @override
  void initState() {
    super.initState();
    controller = ExpandableController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ExpandCollapseWidget)')),
      body: ListView(
        children: [
          buildCard('Expandable1', 'assets/images/brailka.jpg'),
        ],
      ),
    );
  }

  Widget buildCard(String title, String assetImage) {
    return ExpandableNotifier(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              GestureDetector(
                child: Image.asset(assetImage),
                onTap: () => controller.toggle(),
              ),
              ScrollOnExpand(
                child: ExpandablePanel(
                  controller: controller,
                  theme: ExpandableThemeData(
                    expandIcon: Icons.arrow_downward,
                    collapseIcon: Icons.arrow_upward,
                    tapBodyToCollapse: true,
                    tapBodyToExpand: true,
                  ),
                  header: Text(title,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  collapsed: Text(
                    lorem,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    softWrap: true,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  expanded: Text(
                    List.generate(3, (_) => lorem).join('\n\n'),
                    style: TextStyle(fontSize: 18),
                  ),
                  builder: (_, collapsed, expanded) => Padding(
                    padding: const EdgeInsets.all(10.0).copyWith(top: 0),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
