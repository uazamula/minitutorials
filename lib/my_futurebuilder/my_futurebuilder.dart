import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
// http: ^0.13.4
class MyFutureBuilder extends StatefulWidget {
  const MyFutureBuilder({Key? key}) : super(key: key);

  @override
  _MyFutureBuilderState createState() => _MyFutureBuilderState();
}

class _MyFutureBuilderState extends State<MyFutureBuilder> {
  late Future<int> dataFuture;
  late Future<int?> dataFutureFinally;


  @override
  void initState() {
    super.initState();
    dataFuture = getDataRandomRight();
    dataFutureFinally = getDataFinally();
  }

  Future<int> getData() async {
    await Future.delayed(Duration(seconds: 4));
    return 7;
  }

  Future<int> getDataError() async {
    await Future.delayed(Duration(seconds: 4));
    throw 'Failed';//error
  }
  Future<int> getDataRandomWrong() async{
    await Future.delayed(Duration(seconds: 1));

    final result = await get(
      Uri.parse('http://www.randomnumberapi.com/api/v1.0/random')
    );
    final body = json.decode(result.body);
    int randomNumber = (body as List).first;
    return randomNumber;
  }

  Future<int> getDataRandomRight() async{
    await Future.delayed(Duration(seconds: 2));

    final result = await get(
        Uri.parse('http://www.randomnumberapi.com/api/v1.0/random')
    );
    final body = json.decode(result.body);
    int randomNumber = (body as List).first;
    return randomNumber;
  }

  Future<int?> getDataFinally() async{

    final result = await get(
        Uri.parse('http://www.randomnumberapi.com/api/v1.0/random')
    );
    await Future.delayed(Duration(seconds: 2));
    final body = json.decode(result.body);
    int randomNumber = (body as List).first;
    return randomNumber;
    // return null;
  }

  final controller = PageController(initialPage: 0);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyFutureBuilder)'),
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
          buildScaffold(Text('⏳️ waiting')),
          buildScaffold(CircularProgressIndicator()),
          Scaffold(
              appBar: AppBar(
                title: Text('FutureBuilderError'),
              ),
              body: Center(
                child: FutureBuilder<int?>(
                  future: getDataError(), // DON'T DO THIS!!!
                  builder: (context, snapshot) {
                    if(snapshot.hasError){
                      final error = snapshot.error;
                      return Text('😕 $error');
                    }else if (snapshot.hasData) {
                      int data = snapshot.data!;
                      return Text('✅️ $data');
                    } else {
                      return Text('⏳️ waiting');
                    }
                  },
                ),
              )),


          Scaffold(
              appBar: AppBar(
                title: Text('FutureBuilderRandomWrong'),
              ),
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.refresh),
                onPressed: (){setState(() {

                });},
              ),
              body: Center(
                child: FutureBuilder<int?>(
                  future: getDataRandomWrong(), // DON'T DO THIS!!!
                  builder: (context, snapshot) {
                    if(snapshot.hasError){
                      final error = snapshot.error;
                      return Text('😕 $error');
                    }else if (snapshot.hasData) {
                      int data = snapshot.data!;
                      return Text('✅️ $data');
                    } else {
                      return Text('⏳️ waiting');
                    }
                  },
                ),
              )),

          Scaffold(
              appBar: AppBar(
                title: Text('FutureBuilderRandomRight'),
              ),
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.refresh),
                onPressed: (){setState(() {
                  // dataFuture = getDataRandomRight();

                });},
              ),
              body: Center(
                child: FutureBuilder<int?>(
                  future: dataFuture, // DO THIS!!!
                  builder: (context, snapshot) {
                    if(snapshot.hasError){
                      final error = snapshot.error;
                      return Text('😕 $error');
                    }else if (snapshot.hasData) {
                      int data = snapshot.data!;
                      return Text('✅️ $data');
                    } else {
                      return Text('⏳️ waiting');
                    }
                  },
                ),
              )),

          Scaffold(
              appBar: AppBar(
                title: Text('FutureBuilderRandomFinally'),
              ),
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.refresh),
                onPressed: (){setState(() {
                  dataFutureFinally = getDataFinally();

                });},
              ),
              body: Center(
                child: FutureBuilder<int?>(
                  future: dataFutureFinally, // DO THIS!!!
                  initialData: 555,
                  builder: (context, snapshot) {
                    final error = snapshot.error;
                    int? data = snapshot.data!;

                    switch(snapshot.connectionState){
                      case ConnectionState.waiting:
                        return Text('⏳️ waiting $data $error');
                      case ConnectionState.done:
                      default:
                      if(snapshot.hasError){ //error != null
                        return Text('😕 $error');
                      }else if (snapshot.hasData) { // data!=null
                        return Text('✅️ $data');
                      } else {
                        return Text('No data');
                      }
                    }

                  },
                ),
              ))
        ],
      ),
    );
  }

  Scaffold buildScaffold(Widget myWidget) {
    return Scaffold(
            appBar: AppBar(
              title: Text('FutureBuilder'),
            ),
            body: Center(
              child: FutureBuilder<int?>(
                future: getData(), // DON'T DO THIS!!!
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    int data = snapshot.data!;
                    return Text('✅️ $data');
                  } else {
                    return myWidget;
                  }
                },
              ),
            ));
  }
}
