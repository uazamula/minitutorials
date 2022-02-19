import 'package:flutter/material.dart';
// 1) https://favicon.io/favicon-converter/
// 2) upload png image
// 3) press Download
// 4) move downloaded favicon.ico to "web" folder of project
// 5) delete favicon.png from "web" folder
// 6) add these two rows before <title> tag in index.html file in web folder:
//      <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
//      <link rel="icon" href="favicon.ico" type="image/x-icon">
// 7) launch chrome(web) to see changes

class HowToAddFavicon extends StatefulWidget {
  const HowToAddFavicon({Key? key}) : super(key: key);

  @override
  _HowToAddFaviconState createState() => _HowToAddFaviconState();
}

class _HowToAddFaviconState extends State<HowToAddFavicon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HowToAddFavicon)')),
      body: Container(),
    );
  }
}
