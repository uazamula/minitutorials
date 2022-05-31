import 'package:flutter/material.dart';

class CascadeOperator extends StatefulWidget {
  const CascadeOperator({Key? key}) : super(key: key);

  @override
  _CascadeOperatorState createState() => _CascadeOperatorState();
}

class _CascadeOperatorState extends State<CascadeOperator> {
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
        title: const Text('CascadeOperator)'),
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
            child: CustomPaint(
              painter: RectanglePainter(),
              child: SizedBox(
                width: 250,
                height: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromPoints(Offset.zero, Offset(size.width, size.height));
    canvas.drawRect(
        rect,
        Paint()
          ..color = Colors.blue
          ..strokeWidth = 10
          ..style = PaintingStyle.stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
