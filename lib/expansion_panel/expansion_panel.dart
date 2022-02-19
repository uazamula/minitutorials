import 'package:flutter/material.dart';
import 'package:minitutorials/expansion_panel/item.dart';

class MyExpansionPanel extends StatefulWidget {
  const MyExpansionPanel({Key? key}) : super(key: key);

  @override
  _TemplateState createState() => _TemplateState();
}

class _TemplateState extends State<MyExpansionPanel> {
  static const loremIpsum =
      'Lorem ipsum dolor sit amet,consectetur adipiscing elit';
  final List<Item> items = [
    Item(header: 'Panel1', body: loremIpsum),
    Item(header: 'Panel2', body: loremIpsum),
    Item(header: 'Panel3', body: loremIpsum),
    Item(header: 'Panel4', body: loremIpsum),
    Item(header: 'Panel5', body: loremIpsum),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expansion Panel)')),
      body: SingleChildScrollView(
        //child: ExpansionPanelList.radio(
        child: ExpansionPanelList(
          expansionCallback: (index, isExpanded) {
            setState(() {
              items[index].isExpanded = !isExpanded;
            });
          },
          children: items
              // .map((item) => ExpansionPanelRadio(
              .map((item) => ExpansionPanel(
                  canTapOnHeader: true,
                  // value: item.header,
                  isExpanded: item.isExpanded,
                  headerBuilder: (context, isExpanded) => ListTile(
                        title: Text(
                          item.header,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                  body: ListTile(
                    title: Text(
                      item.body,
                      style: TextStyle(fontSize: 16),
                    ),
                  )))
              .toList(),
        ),
      ),
    );
  }
}
