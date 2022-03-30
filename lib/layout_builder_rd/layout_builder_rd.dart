import 'package:flutter/material.dart';

class MyLayoutBuilderRD extends StatefulWidget {
  const MyLayoutBuilderRD({Key? key}) : super(key: key);

  @override
  _MyLayoutBuilderRDState createState() => _MyLayoutBuilderRDState();
}

class _MyLayoutBuilderRDState extends State<MyLayoutBuilderRD> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    bool isMobile = width < 600;

    return Scaffold(
      appBar: AppBar(title: const Text('MyLayoutBuilderRD)')),
      body: Row(
        children: [
          if (!isMobile)
            Container(
              color: Colors.blue,
              width: 250,
              child: Center(
                child: Text('w: $width, h: $height,\nSIDEBAR'),
              ),
            ),
          Expanded(
            child: Container(
              color: Colors.amber,
              child: Center(
                child: Text('w: $width, h: $height,\nContent'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
