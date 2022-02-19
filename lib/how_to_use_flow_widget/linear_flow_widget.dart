import 'package:flutter/material.dart';

class LinearFlowWidget extends StatefulWidget {
  const LinearFlowWidget({Key? key}) : super(key: key);

  @override
  _LinearFlowWidgetState createState() => _LinearFlowWidgetState();
}

class _LinearFlowWidgetState extends State<LinearFlowWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: FlowMenuDelegate(controller: controller),
      children: <IconData>[
        Icons.menu,
        Icons.mail,
        Icons.call,
        Icons.notifications,
      ].map<Widget>((e) => buildItem(e)).toList(),
    );
  }

  Widget buildItem(IconData icon) => FloatingActionButton(
        onPressed: () {
          if (controller.status == AnimationStatus.completed) {
            controller.reverse();
          } else {
            controller.forward();
          }
        },
        child: Icon(icon),
      );
}

class FlowMenuDelegate extends FlowDelegate {
  final Animation<double> controller;

  FlowMenuDelegate({required this.controller}) : super(repaint: controller);

  @override
  void paintChildren(FlowPaintingContext context) {
    // paintThreeIcons(context);
    final size = context.size;
    double spaceBetween = 10;
    bool isVertical = false;
    for (int i = context.childCount-1; i >= 0; i--) {
      final childSizeWidth = context.getChildSize(i)!.width;
      final childSizeHeight = context.getChildSize(i)!.height;
      final xStart = size.width - childSizeWidth;
      final yStart = size.height - childSizeHeight;

      final dx = (childSizeWidth + spaceBetween) * i;
      final dy = (childSizeHeight + spaceBetween) * i;


      context.paintChild(
        i,
        transform: Matrix4.translationValues(
          isVertical ? xStart : xStart - dx * controller.value,
          isVertical ? yStart - dy * controller.value : yStart,
          0,
        ),
      );
    }

  }

  void paintThreeIcons(FlowPaintingContext context) {
    context.paintChild(
      0, // Icons.mail
      transform: Matrix4.translationValues(50, 100, 0),
    );

    context.paintChild(
      1, // Icons.call
      transform: Matrix4.translationValues(150, 200, 0),
    );

    context.paintChild(
      2, // Icons.notifications
      transform: Matrix4.translationValues(50, 300, 0),
    );
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return false;
  }
}
