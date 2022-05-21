import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// http: ^0.13.4
class PullToRefreshListView extends StatefulWidget {
  const PullToRefreshListView({Key? key}) : super(key: key);

  @override
  _PullToRefreshListViewState createState() => _PullToRefreshListViewState();
}

class _PullToRefreshListViewState extends State<PullToRefreshListView> {
  List<String> items = ["Item1", "Item2", "Item3"];

  Future refresh() async {
    setState(() {
      items.clear();
    });
    await Future.delayed(Duration(seconds: 1));
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List newItems = json.decode(response.body);
      setState(() {
        items = newItems
            .map((e) => 'Item ${e['id']}, title: ${e['title']}')
            .toList();
        // items = ["Item4", "Item5", "Item6"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PullToRefreshListView)')),
      body: items.isEmpty
          ? Center(child: CircularProgressIndicator.adaptive())
          : RefreshIndicator(
              onRefresh: refresh,
              child: ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return ListTile(title: Text(item));
                  }),
            ),
    );
  }
}
