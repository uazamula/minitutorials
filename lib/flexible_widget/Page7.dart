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
          Flexible(
            child: Container(
              height: 400,//fill height or less
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Flexible\nh=400 or less\nflex=default value(1)',
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
                  'Flexible\nh=400 or less\nflex=2 (priority is flex,\n=>actually h>400)',
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
