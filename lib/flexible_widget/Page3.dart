import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

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
              height: 250,//fill height or less
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
            height: 400,
            color: Colors.green,
            child: Center(
              child: Text(
                '400.0',
                style: TextStyle(fontSize: 34, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
