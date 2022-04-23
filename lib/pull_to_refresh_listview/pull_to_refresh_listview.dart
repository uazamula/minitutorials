import 'package:flutter/material.dart';

class PullToRefreshListView extends StatefulWidget {
  const PullToRefreshListView({Key? key}) : super(key: key);

  @override
  _PullToRefreshListViewState createState() => _PullToRefreshListViewState();
}

class _PullToRefreshListViewState extends State<PullToRefreshListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PullToRefreshListView)')),
      body: Center(),
    );
  }
}