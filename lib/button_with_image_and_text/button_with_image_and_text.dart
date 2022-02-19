import 'package:flutter/material.dart';

class ButtonWithImageAndText extends StatefulWidget {
  const ButtonWithImageAndText({Key? key}) : super(key: key);

  @override
  _ButtonWithImageAndTextState createState() => _ButtonWithImageAndTextState();
}

class _ButtonWithImageAndTextState extends State<ButtonWithImageAndText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ButtonWithImageAndText)')),
      body: Center(
        child: Material(
          color: Colors.blue,
          elevation: 8,
          borderRadius: BorderRadius.circular(46),
          // shape: CircleBorder(),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: InkWell(
            splashColor: Colors.greenAccent,
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.yellow, width: 5),
                borderRadius: BorderRadius.circular(36),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Ink.image(
                    image: AssetImage('assets/images/brailka.jpg'),
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                    child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Button on image',
                          style: TextStyle(fontSize: 26),
                        )),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Button',
                    style: TextStyle(fontSize: 32, color: Colors.white),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
