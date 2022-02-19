import 'package:flutter/material.dart';

class PageWithImage extends StatelessWidget {
  const PageWithImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/brailka.jpg');
  }
}
