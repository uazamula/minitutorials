import 'dart:math';

import 'package:flutter/material.dart';

class MyStreamBuilder extends StatefulWidget {
  const MyStreamBuilder({Key? key}) : super(key: key);

  @override
  _MyStreamBuilderState createState() => _MyStreamBuilderState();
}

class _MyStreamBuilderState extends State<MyStreamBuilder> {
  final controller = PageController(initialPage: 0);

  late Stream<int?> numbersStream;

  @override
  void initState() {
    super.initState();
    numbersStream = getNumbers(2);
  }

  Future<int?> getNumber() async {
    await Future.delayed(Duration(seconds: 4));
    return 1;
  }

  Stream<int?> getNumbers(int? number) async* {
    await Future.delayed(Duration(seconds: 4));
    // if (Random().nextInt(2) < 1) throw 'AN Error'; else
      yield 1;


    await Future.delayed(Duration(seconds: 1));
    yield number;

    await Future.delayed(Duration(seconds: 1));
    yield 3;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyStreamBuilder)'),
        actions: [
          IconButton(
              onPressed: () => controller.previousPage(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  ),
              icon: Icon(Icons.arrow_left)),
          IconButton(
              onPressed: () => controller.nextPage(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  ),
              icon: Icon(Icons.arrow_right)),
        ],
      ),
      body: PageView(
        // physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          /* Center(
            child: StreamBuilder<int?>(
              stream: getNumbers(2), //DON'T DO THIS
              builder: (context, snapshot) {
                return Text('Wait ${snapshot.data}');
              },
            ),
          ),*/
          //Case 1
          Center(
            child: StreamBuilder<int?>(
              stream: Random().nextInt(2) < 1
                  ? null
                  : getNumbers(
                      Random().nextInt(2) < 1 ? null : Random().nextInt(10)),
              //DON'T DO THIS!
              builder: buildBuilder,
            ),
          ),

          //Case 2
          Center(
            child: StreamBuilder<int?>(
              stream: numbersStream,
              builder: buildBuilder,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            //numbersStream=getNumbers(2); //do this if you want to reload this stream in Case2
          });
        },
      ),
    );
  }

  Widget buildBuilder(context, snapshot) {
    //return must be anyway
    switch (snapshot.connectionState) {
      //Stream is null
      case ConnectionState.none:
        return Text('Stream is null');
      //Stream waits for first value
      case ConnectionState.waiting:
          return Text('Wait');
      //Stream has not yet finished
      case ConnectionState.active:
        if (snapshot.hasData) {
          return Text('Wait ${snapshot.data}');
        } else if (snapshot.hasError) {
          return Text(snapshot.error);
        } else {
          return Text('No data!');
        }
      //Stream has finished
      case ConnectionState.done:
        if (snapshot.hasData) {
          return Text('The last number is ${snapshot.data}');
        } else {
          return Text('There is no number in last position');
        }
      default:
        return Text('WTF');
    }
  }
}
