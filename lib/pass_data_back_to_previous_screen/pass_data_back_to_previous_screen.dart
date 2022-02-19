import 'package:flutter/material.dart';

class PassDataFirstScreen extends StatefulWidget {
  const PassDataFirstScreen({Key? key}) : super(key: key);

  @override
  _PassDataFirstScreenState createState() => _PassDataFirstScreenState();
}

class _PassDataFirstScreenState extends State<PassDataFirstScreen> {
  String value = 'Screen 1 Data';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen 1)')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(value),
            ElevatedButton(
              child: Text('Pass Data'),
              onPressed: () async{
                final newValue = await
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PassDataSecondScreen(value: value)));
                setState(() {
                  this.value = newValue;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PassDataSecondScreen extends StatefulWidget {
  final String value;

  const PassDataSecondScreen({Key? key, required this.value}) : super(key: key);

  @override
  _PassDataSecondScreenState createState() => _PassDataSecondScreenState();
}

class _PassDataSecondScreenState extends State<PassDataSecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 2'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(widget.value, style: TextStyle(fontSize: 32)),
          SizedBox(
            height: 32,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(24),
                textStyle: TextStyle(fontSize: 28),
              ),
              onPressed: () => Navigator.of(context).pop('Screen 2 Data'),
              child: Text('Return Data'))
        ]),
      ),
    );
  }
}
