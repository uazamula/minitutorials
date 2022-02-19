import 'package:flutter/material.dart';
import 'package:minitutorials/how_to_use_flow_widget/linear_flow_widget.dart';

class HowToUseFlowWidget extends StatefulWidget {
  const HowToUseFlowWidget({Key? key}) : super(key: key);

  @override
  _HowToUseFlowWidgetState createState() => _HowToUseFlowWidgetState();
}

class _HowToUseFlowWidgetState extends State<HowToUseFlowWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HowToUseFlowWidget)')),
      body: LinearFlowWidget(),
    );
  }
}