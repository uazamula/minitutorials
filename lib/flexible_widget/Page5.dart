import 'package:flutter/material.dart';

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

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
          Expanded(
            flex: 1,
            child: Container(
              height: 200,//fill height or less
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Expanded\nh=200 (ignored))\nflex=1',
                  style: TextStyle(fontSize: 34, color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 250,
              color: Colors.green,
              child: Center(
                child: Text(
                  'Expanded\nh=250 (ignored)\nflex=2',
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
