import 'package:flutter/material.dart';

class MaskTextWithImage extends StatefulWidget {
  const MaskTextWithImage({Key? key}) : super(key: key);

  @override
  _MaskTextWithImageState createState() => _MaskTextWithImageState();
}

class _MaskTextWithImageState extends State<MaskTextWithImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MaskTextWithImage)')),
      body: Container(),
    );
  }
}