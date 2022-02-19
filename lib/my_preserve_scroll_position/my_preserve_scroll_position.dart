import 'package:flutter/material.dart';

final bucketGlobal = PageStorageBucket();

class MyPreserveScrollPosition extends StatefulWidget {
  const MyPreserveScrollPosition({Key? key}) : super(key: key);

  @override
  _MyPreserveScrollPositionState createState() =>
      _MyPreserveScrollPositionState();
}

class _MyPreserveScrollPositionState extends State<MyPreserveScrollPosition> {
  int index = 0;


  @override
  void initState() {
    super.initState();

    final state = PageStorage.of(context)!.readState(
        context, identifier: bucketGlobal);
    print(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Page Storage Key'), actions: [
            IconButton(onPressed:
            () =>
        Navigator.of(context).push(
        MaterialPageRoute(builder: (context)=>PersistPageStoragePage())),
    icon: Icon(Icons.navigate_next)
    ,)]),
      body: PageStorage(bucket: bucketGlobal, child: buildPageOne(),),
      // body: buildPageOne(),
    );
  }

  Widget buildPageOne() =>
      ListView.builder(
        key: PageStorageKey<String>('pageOne'),
        itemCount: 40,
        itemBuilder: (context, index) =>
            ListTile(
              title: Text(
                  'List item ${index + 1}', style: TextStyle(fontSize: 24)),
            ),
      );

  Widget buildPageTwo() => Container();
}

class PersistPageStoragePage extends StatelessWidget {
  const PersistPageStoragePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),);
  }
}
