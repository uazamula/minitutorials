import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

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
              height: 200,//fill height or less
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Flexible\nh=200 or less\nflex=1',
                  style: TextStyle(fontSize: 34, color: Colors.white),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              height: 250,
              color: Colors.green,
              child: Center(
                child: Text(
                  'Flexible\nh=250 or less\nflex=2',
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
