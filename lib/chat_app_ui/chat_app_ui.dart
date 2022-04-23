import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:minitutorials/chat_app_ui/message.dart';

//  grouped_list: ^4.2.0
//  intl: ^0.17.0

class ChatAppUI extends StatefulWidget {
  const ChatAppUI({Key? key}) : super(key: key);

  @override
  _ChatAppUIState createState() => _ChatAppUIState();
}

class _ChatAppUIState extends State<ChatAppUI> {
  List<Message> messages = [
    Message(
      text: 'Yes, sure!',
      date: DateTime.now().subtract(Duration(minutes: 1)),
      isSentByMe: true,
    ),
    Message(
      text: 'Will you come?',
      date: DateTime.now().subtract(Duration(minutes: 2)),
      isSentByMe: false,
    ),
    Message(
      text: 'What a nice day!',
      date: DateTime.now().subtract(Duration(days: 2)),
      isSentByMe: false,
    ),
  ].reversed.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ChatAppUI)')),
      body: Column(children: [
        Expanded(
          child: GroupedListView<Message, DateTime>(
            padding: EdgeInsets.all(8),
            reverse: true,
            // zusammen mit "order: GroupedListOrder.DESC,"
            order: GroupedListOrder.DESC,
            // zusammen mit "reverse: true,"
            useStickyGroupSeparators: true,
            floatingHeader: true,
            elements: messages,
            groupBy: (message) => DateTime(
              message.date.year,
              message.date.month,
              message.date.day,
            ),
            groupHeaderBuilder: (Message message) => SizedBox(
                height: 40,
                child: Center(
                  child: Card(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        DateFormat.yMMMd().format(message.date),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )),
            itemBuilder: (context, Message message) => Align(
              alignment: message.isSentByMe
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),

                  )),
                  elevation: 8,
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(message.text),
                  )),
            ),
          ),
        ), // not work in Web
        Container(
          color: Colors.grey.shade300,
          child: TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(12),
                hintText: 'Type your message here...'),
            onSubmitted: (text) {
              final message =
                  Message(text: text, date: DateTime.now(), isSentByMe: true);
              setState(() {
                messages.add(message);
              });
            },
          ),
        )
      ]),
    );
  }
}
