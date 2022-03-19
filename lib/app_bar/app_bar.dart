import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyAppBar)'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Container(
            height: 80,
            color: Colors.black26,
            child: Center(child: Text('Bottom'),),
          ),
        ),
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications_active)),

        ],
      ),
      body: Center(),
    );
  }
}
