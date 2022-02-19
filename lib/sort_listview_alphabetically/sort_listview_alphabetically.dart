import 'package:flutter/material.dart';
import 'package:minitutorials/sort_listview_alphabetically/profile.dart';

class HowToSortListViewAlphabetically extends StatefulWidget {
  const HowToSortListViewAlphabetically({Key? key}) : super(key: key);

  @override
  _HowToSortListViewAlphabeticallyState createState() =>
      _HowToSortListViewAlphabeticallyState();
}

class _HowToSortListViewAlphabeticallyState
    extends State<HowToSortListViewAlphabetically> {
  bool isDescending = false;
  List<Profile> items = [
    Profile(name: 'Murphy'),
    Profile(name: 'Oliver'),
    Profile(name: 'Yasmin', subtitle: 'Subtitle for Yasmin'),
    Profile(name: 'Zahara'),
    Profile(name: 'Anna', subtitle: 'Subtitle for Anna'),
    Profile(name: 'Brandon'),
    Profile(name: 'Emma'),
    Profile(name: 'Lucas', subtitle: 'Subtitle for Lucas'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HowToSortListViewAlphabetically)')),
      body: Column(
        children: [
          TextButton.icon(
            onPressed: () {
              setState(() => isDescending = !isDescending);
            },
            icon: RotatedBox(
              quarterTurns: 1,
              child: Icon(
                Icons.compare_arrows,
                size: 28,
              ),
            ),
            label: Text(isDescending ? 'Descending' : 'Ascending',
                style: TextStyle(fontSize: 16)),
          ),
          Expanded(child: buildList()),
        ],
      ),
    );
  }

  ListView buildList() {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          // final sortedItems = isDescending?items.reversed.toList():items;
          final sortedItems = items
            ..sort((item1, item2) => isDescending
                ? item2.name.compareTo(item1.name)
                : item1.name.compareTo(item2.name));
          final item = sortedItems[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage('assets/images/brailka.jpg'),
            ),
            title: Text(item.name),
            subtitle: Text(item.subtitle),
            onTap: () {},
          );
        });
  }
}
