import 'package:flutter/material.dart';

class Page8 extends StatelessWidget {
  const Page8({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border.symmetric(
              vertical: BorderSide(color: Colors.black, width: 20))),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 200,
              width: 200,//ignores width!
              color: Colors.green,
              child: Center(
                child: Text(
                  'Expanded\nheight=200',
                  style: TextStyle(fontSize: 34, color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 150,
              color: Colors.red,
              child: Center(
                child: Text(
                  'Expanded\nheight=150',
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
