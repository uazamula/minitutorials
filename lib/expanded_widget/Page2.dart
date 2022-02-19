import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

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
          Expanded(
            child: Container(
              height: 150, //ignores height!
              color: Colors.red,
              child: Center(
                child: Text(
                  'Expanded',
                  style: TextStyle(fontSize: 34, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
