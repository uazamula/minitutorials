import 'package:flutter/material.dart';

class GestureDetectorAndIncWell extends StatefulWidget {
  const GestureDetectorAndIncWell({Key? key}) : super(key: key);

  @override
  State<GestureDetectorAndIncWell> createState() =>
      _GestureDetectorAndIncWellState();
}

class _GestureDetectorAndIncWellState extends State<GestureDetectorAndIncWell> {
  String text = 'None';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InkWell'),
      ),
      body: Center(
          child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Material(
          child: InkWell /*GestureDetector*/ (
            highlightColor: Colors.orange.withOpacity(0.3),
            splashColor: Colors.red.withOpacity(0.5),
            onTap: () => setState(() {
              text = 'Single Tap';
            }),
            onDoubleTap: () => setState(() {
              text = 'Double Tap';
            }),
            onLongPress: () => setState(() {
              text = 'Long Press';
            }),
            child: Ink /*Container*/ (
              child: Center(
                child: Text(text),
              ),
              color: Colors.blue,
              height: 200,
              width: 200,
            ),
          ),
        ),
      )),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
