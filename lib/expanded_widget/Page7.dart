import 'package:flutter/material.dart';

class Page7 extends StatelessWidget {
  const Page7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border.symmetric(
              vertical: BorderSide(color: Colors.black, width: 20))),
      child: Column(
        children: [
          Expanded(
            child: Container(
              height: 200,//ignores height!
              width: 300,
              color: Colors.green,
              child: Center(
                child: Text(
                  'Expanded\nwidth=300',
                  style: TextStyle(fontSize: 34, color: Colors.white),
                ),
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
