import 'package:flutter/material.dart';

class InfiniteScrollingListView extends StatefulWidget {
  const InfiniteScrollingListView({Key? key}) : super(key: key);

  @override
  _InfiniteScrollingListViewState createState() => _InfiniteScrollingListViewState();
}

class _InfiniteScrollingListViewState extends State<InfiniteScrollingListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('InfiniteScrollingListView)')),
      body: Center(),
    );
  }
}