import 'package:flutter/material.dart';

class Page8 extends StatelessWidget {
  const Page8({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border.symmetric(
              vertical: BorderSide(color: Colors.black, width: 20))),
      child: Column(
        children: [
          Flexible(
            child: Image.asset('assets/images/brailka.jpg',
              height: 400,//fill height or less
              width: double.infinity,
              fit: BoxFit.cover
            ),
          ),
          Container(
            height: 500,
            color: Colors.green,
            child: Center(
              child: Text(
                'More Widgets',
                style: TextStyle(fontSize: 34, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
