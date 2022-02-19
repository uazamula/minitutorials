import 'package:flutter/material.dart';
import 'package:minitutorials/hero_widget/Page2.dart';

class MyHeroWidget extends StatefulWidget {
  const MyHeroWidget({Key? key}) : super(key: key);

  @override
  _MyHeroWidgetState createState() => _MyHeroWidgetState();
}

class _MyHeroWidgetState extends State<MyHeroWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MyHeroWidget Page1)')),
      body: GestureDetector(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Page2())),
        child: Hero(
            tag: 'image1',
            child: Image.asset(
              'assets/images/buddha.jpg',
              width: 200,
            )),
      ),
    );
  }
}
