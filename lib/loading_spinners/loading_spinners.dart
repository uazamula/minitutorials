import 'package:flutter/material.dart';
import 'package:minitutorials/loading_spinners/loading_page.dart';

class MyLoadingSpinners extends StatefulWidget {
  const MyLoadingSpinners({Key? key}) : super(key: key);

  @override
  _MyLoadingSpinners createState() => _MyLoadingSpinners();
}

class _MyLoadingSpinners extends State<MyLoadingSpinners> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return isLoading? LoadingPage()
        :Scaffold(appBar: AppBar(
      title: Text('Loading Spinner'),
    ),
    body: Center(
      child: ElevatedButton(
        child:  Text('Load Data'),
        onPressed: ()async{
          setState(() {
            isLoading=true;
          });
          await Future.delayed(Duration(seconds: 3));
          setState(() {
            isLoading=false;
          });

        },
      ),
    ),);
  }
}