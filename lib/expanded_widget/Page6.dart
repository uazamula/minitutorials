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
          Expanded(
            flex: 1,
            child: Container(
              height: 200,//ignores height!
              color: Colors.green,
              child: Center(
                child: Text(
                  'Expanded\nflex = 1',
                  style: TextStyle(fontSize: 34, color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 150, //ignores height!
              color: Colors.red,
              child: Center(
                child: Text(
                  'Expanded\nflex = 2',
                  style: TextStyle(fontSize: 34, color: Colors.white),
                ),
              ),
            ),
          ),
          Container(
            height: 450,
            color: Colors.blue,
            child: Center(
              child: Text(
                '450',
                style: TextStyle(fontSize: 34, color: Colors.black),
              ),
            ),
          ),],
      ),
    );
  }
}
