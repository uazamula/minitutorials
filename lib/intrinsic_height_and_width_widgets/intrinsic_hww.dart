import 'package:flutter/material.dart';

class IntrinsicHeightAndWidthWidgets extends StatefulWidget {
  const IntrinsicHeightAndWidthWidgets({Key? key}) : super(key: key);

  @override
  _IntrinsicHeightAndWidthWidgetsState createState() =>
      _IntrinsicHeightAndWidthWidgetsState();
}

class _IntrinsicHeightAndWidthWidgetsState
    extends State<IntrinsicHeightAndWidthWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('App)')),
      body: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Image.asset(
                'assets/images/buddha.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
                flex: 3,
                child: Text(
                  'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum ',
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
