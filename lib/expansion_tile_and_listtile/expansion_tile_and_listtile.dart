import 'package:flutter/material.dart';

class MyExpansionTileAndListTile extends StatefulWidget {
  const MyExpansionTileAndListTile({Key? key}) : super(key: key);

  @override
  _MyExpansionTileAndListTileState createState() => _MyExpansionTileAndListTileState();
}

class _MyExpansionTileAndListTileState extends State<MyExpansionTileAndListTile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expansion Tile And ListTile)')),
      body: ExpansionTile(
        title: Text('Animals'),
        children: [
          ListTile(title: Text('Dog'), onTap: () {},),
          ListTile(title: Text('Cat'), onTap: () {},),
          ListTile(title: Text('Fish'), onTap: () {},),
          ListTile(title: Text('Bird'), ),
        ],
        onExpansionChanged: ( isExpanded){print('Expanded $isExpanded');},
      ),
    );
  }
}