import 'package:flutter/material.dart';

class ClipPathBezier extends StatefulWidget {
  const ClipPathBezier({Key? key}) : super(key: key);

  @override
  _ClipPathBezierState createState() => _ClipPathBezierState();
}

class _ClipPathBezierState extends State<ClipPathBezier> {
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
        title: const Text('ClipPathBezier)'),
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
      body: PageView(controller: controller, children: [
        buildClipPath(1),
        buildClipPath(2),
        buildClipPath(3),
        buildClipPath(4)
      ]),
    );
  }

  Widget buildClipPath(int page) {
    return ClipPath(
        clipper: CustomClipPath(page: page),
        child: Container(
          color: Colors.red,
          child: Center(
            child: Text('Clip path'),
          ),
          height: 200,
        ));
  }
}

class CustomClipPath extends CustomClipper<Path> {
  int page;

  CustomClipPath({this.page = 1});

  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    Path path;
    switch (page) {
      case 1:
        path = curve1(h, w);
        break;
      case 2:
        path = curve2(h, w);
        break;
      case 3:
        path = curve3(h, w);
        break;
      case 4:
        path = curve4(h, w);
        break;
      default:
        path = curve1(h, w);
    }
    return path;
  }

  Path curve1(double h, double w) {
    final path = Path();
    // (0,0) //               1-st point
    path.lineTo(0, h); //2-nd point
    path.lineTo(w / 2, 4 / 5 * h); //3-rd point
    path.lineTo(w, h); //4-th point
    path.lineTo(w, 0); //5-th point
    path.close();
    return path;
  }

  Path curve2(double h, double w) {
    final path = Path();
    // (0,0) //          1-st point
    path.lineTo(0, h); //2-nd point
    path.quadraticBezierTo(
        w / 2,
        4 / 5 * h, //3-rd point
        w,
        h //4-th point
        );
    path.lineTo(w, 0); //5-th point
    path.close();
    return path;
  }

  Path curve3(double h, double w) {
    final path = Path();
    path.moveTo(0, 100); //1-st point
    path.lineTo(0, h); //2-nd point
    path.quadraticBezierTo(
        w / 2,
        4 / 5 * h, //3-rd point
        w,
        h //4-th point
        );
    path.lineTo(w, 0); //5-th point
    path.close();
    return path;
  }

  Path curve4(double h, double w) {
    final path = Path();
    double bottomlinecoef= 3/4;
    path.moveTo(0, 0); //1-st point
    path.lineTo(0, h*bottomlinecoef); //2-nd point
    path.quadraticBezierTo(
        w / 4, h*(bottomlinecoef-1/4), //3-rd point
        w / 2, h*bottomlinecoef //4-th point
        );
    path.quadraticBezierTo(
        w * 3 / 4,
        h*(bottomlinecoef+1/4), //5-rd point
        w,
        h*bottomlinecoef //6-th point
        );
    path.lineTo(w, 0); //7-th point
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
