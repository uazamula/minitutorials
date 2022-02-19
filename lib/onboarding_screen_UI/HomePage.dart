import 'package:flutter/material.dart';
import 'package:minitutorials/onboarding_screen_UI/onboarding_screen_UI.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
          actions: [
            IconButton(
                onPressed: () async {
                  // navigate directly on onboarding page
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('showHome', false);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => MyOnBoardingScreenUI(),
                    ),
                  );
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: Container(
          child: Text('HomePage'),
        ));
  }
}
