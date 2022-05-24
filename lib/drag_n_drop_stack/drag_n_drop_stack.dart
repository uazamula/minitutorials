import 'package:flutter/material.dart';

class DragNDropStack extends StatefulWidget {
  const DragNDropStack({Key? key}) : super(key: key);

  @override
  _DragNDropStackState createState() => _DragNDropStackState();
}

class _DragNDropStackState extends State<DragNDropStack> {
  final controller = PageController(initialPage: 0);
  List<Color> stack1 = [Colors.red, Colors.blue];
  List<Color> stack2 = [Colors.green];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DragNDropStack)'),
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildStack(stack1),
                buildStack(stack2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStack(List<Color> stack) {
    return DragTarget<Color>(
      onAccept: (data) {
        if(stack.isNotEmpty && data == stack.last) return;
        setState(() {
          stack.add(data);
          final otherStacks = [stack1,stack2]..remove(stack);
          for(final stack in otherStacks) {
            stack.remove(data);
          }
        });
      },
      builder: (context, _, __) => Stack(children: [
        Container(
          color: Colors.black,
          width: 200,
          height: 200,
          child: Center(
            child: Text(
              'Empty',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        ...stack.map(buildStackItem).toList(),
      ]),
    );
  }

  Widget buildStackItem(Color color) {
    final coloredBox = Container(
      color: color,
      width: 200,
      height: 200,
    );
    return Draggable(
      data: color,
      child: coloredBox,
      feedback: coloredBox,
      childWhenDragging: SizedBox(
        width: 200,
        height: 200,
      ),
    );
  }
}
