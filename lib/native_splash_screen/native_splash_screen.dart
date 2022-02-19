import 'package:flutter/material.dart';
// insert in pubspec.yaml last four rows
// dev_dependencies:
//   flutter_test:
//     sdk: flutter
//
//   flutter_native_splash: ^2.0.2
// flutter_native_splash:
//   image: assets/images/alarm.png
//   color: "#000f0f" //or background_image: assets/images/any_png_image.png

//then

// run these three commands in terminal firstly and every time when data in pubspec.yaml changes :
//flutter clean
//flutter pub get
//flutter pub run flutter_native_splash:create

class MyNativeSplashScreen extends StatefulWidget {
  const MyNativeSplashScreen({Key? key}) : super(key: key);

  @override
  _MyNativeSplashScreenState createState() => _MyNativeSplashScreenState();
}

class _MyNativeSplashScreenState extends State<MyNativeSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Native splash Screen)')),
      body: Container(),
    );
  }
}