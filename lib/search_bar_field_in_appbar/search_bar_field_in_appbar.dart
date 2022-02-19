import 'package:flutter/material.dart';
import 'package:minitutorials/search_bar_field_in_appbar/my_search_delegate.dart';

class SearchBarFieldInAppBar extends StatefulWidget {
  const SearchBarFieldInAppBar({Key? key}) : super(key: key);

  @override
  _TemplateState createState() => _TemplateState();
}

class _TemplateState extends State<SearchBarFieldInAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        actions: [IconButton(onPressed: () {
          showSearch(context: context, delegate: MySearchDelegate());
        }, icon: const Icon(Icons.search))
        ],
      ),
      body: Container(),
    );
  }
}
