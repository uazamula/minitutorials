import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border.symmetric(
              vertical: BorderSide(color: Colors.black, width: 20))),
      child: Column(
        children: [
          Container(
            height: 200,
            color: Colors.green,
            child: Center(
              child: Text(
                '200.0',
                style: TextStyle(fontSize: 34, color: Colors.white),
              ),
            ),
          ),
          Container(
            height: 150,
            color: Colors.red,
            child: Center(
              child: Text(
                '150.0',
                style: TextStyle(fontSize: 34, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
