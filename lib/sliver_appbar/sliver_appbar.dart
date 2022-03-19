import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//!!!! It doesn't work properly in Chrome(web)

class MySliverAppBar extends StatefulWidget {
  const MySliverAppBar({Key? key}) : super(key: key);

  @override
  _MySliverAppBarState createState() => _MySliverAppBarState();
}

class _MySliverAppBarState extends State<MySliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: const Text('MySliverAppBar)')),
        body: NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          expandedHeight: 240,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('SliverAppbar'),
            background: Image.asset(
              'assets/images/brailka.jpg',
              fit: BoxFit.cover,
            ),
          ),
          floating: true,
            snap: false,
          pinned: true,
        ),
      ],
      body: ListView.separated(
        padding: EdgeInsets.all(12),
        itemBuilder: (context, index) => ListTile(title: Text('Item$index')),
        separatorBuilder: (context, index) => Container(
          height: 8,
          color: Colors.purple,
        ),
        itemCount: 30,
      ),
    ));
  }
}
