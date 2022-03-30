import 'package:flutter/material.dart';

class ChatAppUI extends StatefulWidget {
  const ChatAppUI({Key? key}) : super(key: key);

  @override
  _ChatAppUIState createState() => _ChatAppUIState();
}

class _ChatAppUIState extends State<ChatAppUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ChatAppUI)')),
      body: Center(),
    );
  }
}
