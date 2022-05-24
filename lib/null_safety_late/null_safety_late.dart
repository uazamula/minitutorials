import 'package:flutter/material.dart';

class NullSafetyLate extends StatefulWidget {
  const NullSafetyLate({Key? key}) : super(key: key);

  @override
  _NullSafetyLateState createState() => _NullSafetyLateState();
}

class _NullSafetyLateState extends State<NullSafetyLate> {
  final controller = PageController(initialPage: 0);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String? variableIsNull = null;
    String? variableIsNotNull = 'value';
    late String variableLate;

    variableLate = 'some late text';
    return Scaffold(
      appBar: AppBar(
        title: const Text('NullSafetyLate)'),
        actions: [
          IconButton(
              onPressed: () => controller.previousPage(
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
              ),
              icon: Icon(Icons.arrow_left)),
          IconButton(
              onPressed: () => controller.nextPage(
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
              ),
              icon: Icon(Icons.arrow_right)),
        ],
      ),
      body: PageView(
        // physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          Container(
            color: Colors.red,
            child: Column(
              children: [
                // ?
                Text(variableIsNull?.toLowerCase()??'null'),
                Text(variableIsNull?.length.toString()??'null'),
                Text(variableLate),
                // !
                // Text(variableIsNull!.toLowerCase()), // throws exception (null + ! = crash)
                // Text(variableIsNull!.length.toString()), // throws exception (null + ! = crash)

              ],
            ),
          ),
          Container(
            color: Colors.blue,
            child: Column(
              children: [
                // ?
                // Text(variableIsNotNull?.toLowerCase()??'null'),
                // Text(variableIsNotNull?.length.toString()??'null'),
                // // !
                // Text(variableIsNotNull!.toLowerCase()),
                // Text(variableIsNotNull!.length.toString()),

              ],
            ),
          ),
        ],
      ),
    );
  }
}