import 'package:flutter/material.dart';
import 'package:minitutorials/flexible_widget/page_with_image.dart';

class Page9 extends StatelessWidget {
  const Page9({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border.symmetric(
              vertical: BorderSide(color: Colors.black, width: 20))),
      child: Column(
        children: [
          Flexible(
            child: LayoutBuilder(builder: (context, constraints) {
              return constraints.maxHeight < 200
                  ? ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PageWithImage()));
                      },
                      child: Text('See image'))
                  : Image.asset('assets/images/brailka.jpg',
                      height: 400, //fill height or less
                      width: double.infinity,
                      fit: BoxFit.cover);
            }),
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
