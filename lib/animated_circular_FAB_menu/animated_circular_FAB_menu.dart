import 'package:flutter/material.dart';
import 'package:minitutorials/animated_circular_FAB_menu/circular_fab_widget.dart';

class AnimatedCircularFABMenu extends StatefulWidget {
  const AnimatedCircularFABMenu({Key? key}) : super(key: key);

  @override
  _AnimatedCircularFABMenuState createState() => _AnimatedCircularFABMenuState();
}

class _AnimatedCircularFABMenuState extends State<AnimatedCircularFABMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedCircularFABMenu)')),
      body: Center(child: Text('FABs'),),
      floatingActionButton: CircularFabWidget(),
    );
  }
}