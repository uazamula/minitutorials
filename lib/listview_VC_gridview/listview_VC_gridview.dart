import 'package:flutter/material.dart';
import 'package:minitutorials/sort_listview_alphabetically/profile.dart';

class ListViewVCGridView extends StatefulWidget {
  const ListViewVCGridView({Key? key}) : super(key: key);

  @override
  _ListViewVCGridViewState createState() => _ListViewVCGridViewState();
}

class _ListViewVCGridViewState extends State<ListViewVCGridView> {
  bool isGrid = true;
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

  Widget buildList() {
    return isGrid
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0,//by default = 0
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              final item = items[index];
              return GridTile(
                child: InkWell(
                  child: Ink.image(
                    image: AssetImage('assets/images/brailka.jpg'),
                    fit: BoxFit.cover,
                  ),
                  onTap: () => selectItem(item.name),
                ),
                footer: Container(
                  padding: EdgeInsets.all(12),
                  alignment: Alignment.center,
                  child: Text(
                    item.name,
                    style: TextStyle(fontSize: 32, color: Colors.white),
                  ),
                ),
              );
            },
            itemCount: items.length,
          )
        : ListView.builder(
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
                onTap: () {
                  selectItem(item.name);
                },
              );
            });
  }

  void selectItem(String itemName) {
    final snackBar = SnackBar(
      content: Text(
        'Selected $itemName',
        style: TextStyle(fontSize: 24),
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
