import 'package:flutter/material.dart';

class NewMaterial3ColorScheme extends StatefulWidget {
  const NewMaterial3ColorScheme({Key? key}) : super(key: key);

  @override
  _NewMaterial3ColorSchemeState createState() => _NewMaterial3ColorSchemeState();
}

class _NewMaterial3ColorSchemeState extends State<NewMaterial3ColorScheme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NewMaterial3ColorScheme)')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: (){}, child: Text('Elevated')),
            OutlinedButton(onPressed: (){}, child: Text('Outlined')),
            TextButton(onPressed: (){},child: Text('TextButton')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed: (){},),
    );
  }
}