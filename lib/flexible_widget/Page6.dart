import 'package:flutter/material.dart';

class Page6 extends StatelessWidget {
  const Page6({Key? key}) : super(key: key);

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
            flex: 1,
            child: Container(
              height: 450,//fill height or less
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Flexible\nh=450 or less\nflex=1',
                  style: TextStyle(fontSize: 34, color: Colors.white),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              height: 400,
              color: Colors.green,
              child: Center(
                child: Text(
                  'Flexible\nh=400 or less\nflex=2',
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
