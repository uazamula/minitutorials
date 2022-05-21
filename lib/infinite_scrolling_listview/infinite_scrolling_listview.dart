import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
// http: ^0.13.4

class InfiniteScrollingListView extends StatefulWidget {
  const InfiniteScrollingListView({Key? key}) : super(key: key);

  @override
  _InfiniteScrollingListViewState createState() =>
      _InfiniteScrollingListViewState();
}

class _InfiniteScrollingListViewState extends State<InfiniteScrollingListView> {
  // List<String> items = List.generate(15, (index) => 'Item ${index + 1}');
  List<String> items = [];
  final controller = ScrollController();
  int page = 1;
  final limit = 24;
  bool hasMore = true;
  bool isLoading = false;// to spare server resources

  @override
  void initState() {
    super.initState();
    fetch();
    // if (hasMore)
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        fetch();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future fetch() async {
    // await Future.delayed(Duration(seconds: 1));
    if(isLoading) return;// to spare server resources
    isLoading = true;// to spare server resources
    final url = Uri.parse(
        'https://jsonplaceholder.typicode.com/posts?_limit=$limit&_page=$page');
    final response = await get(url);
    if (response.statusCode == 200) {
      final List newItems = json.decode(response.body);
      setState(() {
        page++;
        isLoading = false;// to spare server resources
        if (newItems.length < limit) {
          hasMore = false;
        }
        items.addAll(newItems.map((e) => 'Item ${e['id']}').toList());
      });
    }
    // setState(() {
    //   items.addAll(['Item A','Item B','Item C','Item D',]);
    // });
  }

  Future refresh() async{
    setState(() {
      page = 1;//page=0 is incorrect
      hasMore = true;
      isLoading = false;// to spare server resources
      items.clear();
    });
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('InfiniteScrollingListView)')),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: ListView.builder(
            controller: controller,
            padding: EdgeInsets.all(8),
            itemCount: hasMore ? items.length + 1 : items.length,
            itemBuilder: (context, index) {
              if (index < items.length) {
                final item = items[index];
                return ListTile(title: Text(item));
              } else {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 32),
                  child: Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                );
              }
            }),
      ),
    );
  }
}
