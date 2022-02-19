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
            height: 100,
            color: Colors.red,
            child: Center(
              child: Text(
                '100.0',
                style: TextStyle(fontSize: 34, color: Colors.white),
              ),
            ),
          ),
          Flexible(
            child: Container(
              height: 250,
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Flexible\nh=250 or less',
                  style: TextStyle(fontSize: 34, color: Colors.white),
                ),
              ),
            ),
          ),
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
        ],
      ),
    );
  }
}
