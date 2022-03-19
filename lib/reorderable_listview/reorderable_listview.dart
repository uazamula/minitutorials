import 'package:flutter/material.dart';

class MyReorderableListView extends StatefulWidget {
  const MyReorderableListView({Key? key}) : super(key: key);

  @override
  _MyReorderableListViewState createState() => _MyReorderableListViewState();
}

class _MyReorderableListViewState extends State<MyReorderableListView> {
  final items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MyReorderableListView)')),
      body: ReorderableListView(
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (newIndex > oldIndex) newIndex--;
            final item = items.removeAt(oldIndex);
            items.insert(newIndex, item);
          });
        },
        children: [
          for (final item in items)
            ListTile(
              title: Text(item),
              key: ValueKey(item), //identify each item!
            )
        ],
      ),
    );
  }
}
