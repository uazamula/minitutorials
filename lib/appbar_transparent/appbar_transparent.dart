import 'package:flutter/material.dart';

class MyAppBarTransparent extends StatefulWidget {
  const MyAppBarTransparent({Key? key}) : super(key: key);

  @override
  _TemplateState createState() => _TemplateState();
}

class _TemplateState extends State<MyAppBarTransparent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('MyAppBarTransparent)'),
        centerTitle: true,
        leading: BackButton(),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        backgroundColor: Colors.transparent,
        elevation: 2,
      ),
      body: Image.asset(
        'assets/images/buddha.jpg',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
