import 'package:flutter/material.dart';

class MultiLanguageApp extends StatefulWidget {
  const MultiLanguageApp({Key? key}) : super(key: key);

  @override
  _MultiLanguageAppState createState() => _MultiLanguageAppState();
}

class _MultiLanguageAppState extends State<MultiLanguageApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MultiLanguageApp)')),
      body: Container(),
    );
  }
}
