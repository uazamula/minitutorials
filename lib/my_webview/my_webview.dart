import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
// webview_flutter: ^3.0.1
// insert this row in manifest file:
// <uses-permission android:name="android.permission.INTERNET" />
// https://stackoverflow.com/questions/30637654/android-webview-gives-neterr-cache-miss-message
class MyWebView extends StatefulWidget {
  const MyWebView({Key? key}) : super(key: key);

  @override
  _MyWebViewState createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  late WebViewController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyWebView)'),
        actions: [

          IconButton(onPressed: () async{
            controller.loadUrl('https://youtube.com');
          }, icon: Icon(Icons.auto_fix_high)),

          IconButton(onPressed: () async{
            final url = await controller.currentUrl();
            print('Current website: $url');
          }, icon: Icon(Icons.add)),

          IconButton(onPressed: () async{
            if(await controller.canGoBack())
              controller.goBack();
          }, icon: Icon(Icons.arrow_back)),

          IconButton(onPressed: () async{
              controller.reload();
          }, icon: Icon(Icons.refresh)),

        ],),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'https://www.amazon.com/',
        onWebViewCreated: (controller){
          this.controller=controller;
        },
        onPageStarted: (url){
          print('New website: $url');
        },

      ),
    );
  }
}