import 'package:flutter/material.dart' hide BoxShadow, BoxDecoration;

//   flutter_inset_box_shadow: ^1.0.8
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class MyNewMorphismButton extends StatefulWidget {
  const MyNewMorphismButton({Key? key}) : super(key: key);

  @override
  _MyNewMorphismButtonState createState() => _MyNewMorphismButtonState();
}

class _MyNewMorphismButtonState extends State<MyNewMorphismButton> {
  final controller = PageController(initialPage: 0);
  bool isPressed = false;
  bool isDarkMode = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isDarkMode ? Color(0xFF2E3239) : Color(0xFFE7ECEF);
    Offset distance = isPressed ? Offset(10, 10) : Offset(28, 28);
    double blur = isPressed ? 5.0 : 30.0;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('MyNewMorphismButton)'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isPressed = false;
                });
                controller.previousPage(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );},
              icon: Icon(Icons.arrow_left)),
          IconButton(
              onPressed: () {
                setState(() {
                  isPressed = false;
                });
                controller.nextPage(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );},
              icon: Icon(Icons.arrow_right)),
        ],
      ),
      body: PageView(
        // physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          buildCenter(backgroundColor, blur, distance),
          buildReleasedButton(backgroundColor, blur, distance),
          buildButtonDisappeared(backgroundColor, blur, distance)
        ],
      ),
    );
  }

  Center buildButtonDisappeared(Color backgroundColor, double blur, Offset distance) {
    return Center(
          child: GestureDetector(
            onTap: () => setState(() {
              isPressed = !isPressed;
            }),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: backgroundColor,
                  boxShadow: isPressed?[]:[
                    BoxShadow(
                      blurRadius: blur,
                      offset: -distance,
                      color: isDarkMode ? Color(0xFF35393F) : Colors.white,
                      inset: isPressed,
                    ),
                    BoxShadow(
                      blurRadius: blur,
                      offset: distance,
                      color: isDarkMode ? Color(0xFF23262A) : Color(0xFFA7A9AF),
                      inset: isPressed,
                    )
                  ]),
              child: SizedBox(
                height: 200,
                width: 200,
                child: Center(child: Text('Disappearing Button')),

              ),
            ),
          ),
        );
  }

  Center buildReleasedButton(Color backgroundColor, double blur, Offset distance) {
    return Center(
          child: Listener(

            onPointerUp: (_) => setState(() {
              isPressed = false;
            }),
            onPointerDown: (_) => setState(() {
              isPressed = true;
            }),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: backgroundColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: blur,
                      offset: -distance,
                      color: isDarkMode ? Color(0xFF35393F) : Colors.white,
                      inset: isPressed,
                    ),
                    BoxShadow(
                      blurRadius: blur,
                      offset: distance,
                      color: isDarkMode ? Color(0xFF23262A) : Color(0xFFA7A9AF),
                      inset: isPressed,
                    )
                  ]),
              child: SizedBox(
                height: 200,
                width: 200,
                child: Center(child: Text('Button doesn\'t hold Press')),

              ),
            ),
          ),
        );
  }

  Widget buildCenter(Color backgroundColor, double blur, Offset distance) {
    return Center(
      child: GestureDetector(
        onTap: () => setState(() {
          isPressed = !isPressed;
        }),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: backgroundColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: blur,
                  offset: -distance,
                  color: isDarkMode ? Color(0xFF35393F) : Colors.white,
                  inset: isPressed,
                ),
                BoxShadow(
                  blurRadius: blur,
                  offset: distance,
                  color: isDarkMode ? Color(0xFF23262A) : Color(0xFFA7A9AF),
                  inset: isPressed,
                )
              ]),
          child: SizedBox(
            height: 200,
            width: 200,
            child: Center(child: Text('Button Hold Press')),
          ),
        ),
      ),
    );
  }
}
