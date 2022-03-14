import 'package:flutter/material.dart';

class MyDragAndDrop extends StatefulWidget {
  const MyDragAndDrop({Key? key}) : super(key: key);

  @override
  _MyDragAndDropState createState() => _MyDragAndDropState();
}

class _MyDragAndDropState extends State<MyDragAndDrop> {
  Color color = Colors.black;

  @override
  Widget build(BuildContext context) {
    final showDraggable = color == Colors.black;

    return Scaffold(
      appBar: AppBar(title: const Text('MyDragAndDrop)')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DragTarget<Color>(
              onAccept: (data)=>setState(() {
                color=data;
              }),
                builder: (context,_,__)=>Container(
              color: color,
              width: 200,
              height: 200,
              child: Text('Target',style: TextStyle(color: Colors.blue),),
            )),

            IgnorePointer(
              ignoring: !showDraggable,
              child: Opacity(
                opacity: showDraggable?1:0.1,
                child: Draggable<Color>(
                  data: Colors.teal,
                  child: Container(
                    color: Colors.green,
                    width: 200,
                    height: 200,
                    child: Text('Initial'),
                  ),
                  feedback: Container(
                  color: Colors.orange,
                  width: 200,
                  height: 200,
                    child: Text('Dragging'),
                ),
                  childWhenDragging:  Container(
                  color: Colors.red,
                  width: 200,
                  height: 200,
                    child: Text('Empty'),
                ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
