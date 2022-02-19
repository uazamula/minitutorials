import 'package:flutter/material.dart';

class Page9 extends StatelessWidget {
  const Page9({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border.symmetric(
              vertical: BorderSide(color: Colors.black, width: 20))),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 200,
                width: 200,//ignores width!
                color: Colors.green,
                child: Center(
                  child: Text(
                    'Expanded\nheight=200\nwrap Expanded widget only with Row (or Column) widget',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
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
