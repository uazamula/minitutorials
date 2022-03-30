import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

//   grouped_list: ^4.2.0
class ListViewStickyHeader extends StatefulWidget {
  const ListViewStickyHeader({Key? key}) : super(key: key);

  @override
  _ListViewStickyHeaderState createState() => _ListViewStickyHeaderState();
}

class _ListViewStickyHeaderState extends State<ListViewStickyHeader> {
  final elements = [
    {'group': 'Team A', 'name': 'John'},
    {'group': 'Team B', 'name': 'Johan'},
    {'group': 'Team C', 'name': 'Jack'},
    {'group': 'Team A', 'name': 'Julie'},
    {'group': 'Team B', 'name': 'Jan'},
    {'group': 'Team C', 'name': 'Judy'},
    {'group': 'Team A', 'name': 'Janette'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListViewStickyHeader)')),
      body: GroupedListView<dynamic, String>(
        useStickyGroupSeparators: true,
        elements: elements,
        itemComparator: (item1,item2)=>item1['name'].compareTo(item2['name']),
        groupComparator: (value1,value2)=>value2.compareTo(value1),
        groupBy: (element)=> element['group'],
        groupSeparatorBuilder: (value)=>Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          color: Colors.black,
          child: Text(value,style: TextStyle(color: Colors.white),),
        ),
        itemBuilder: (context, element) => Card(
          elevation: 4,
          child: ListTile(
            contentPadding: EdgeInsets.all(12),
            leading: Icon(
              Icons.account_circle,
              size: 8,
            ),
            title: Text(element['name']),
          ),
        ),
      ),
    );
  }
}
