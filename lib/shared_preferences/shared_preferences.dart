import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:minitutorials/shared_preferences/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
//  shared_preferences: ^2.0.13

class MySharedPreferences extends StatefulWidget {
  const MySharedPreferences({Key? key}) : super(key: key);

  @override
  _MySharedPreferencesState createState() => _MySharedPreferencesState();
}

class _MySharedPreferencesState extends State<MySharedPreferences> {
  String? name = '';
  User? user;
  late SharedPreferences preferences;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    preferences = await SharedPreferences.getInstance();

    final userJson = preferences.getString("user");
    if (userJson == null) return;
    final user = User.fromJson(json.decode(userJson));
    setState(() {
      this.user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MySharedPreferences)')),
      body: Center(
        child: Column(
          children: [
            Text(user==null?'':user!.urlImage),
            Text(user==null?'':user!.name),
            Text(user==null?'':user!.friends.toString()),
            Text(user==null?'':user!.birthday.toString()),
            Text(name!),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () async {
                // preferences.setString("name", "Paul");
                 user = User(
                  name: 'Julie',
                  friends: 81,
                  urlImage: 'assets/images/brailka.jpg',
                  birthday: DateTime(2002,7,9),
                );
                final userJson = json.encode(user!.toJson());
                setState(() {
                  name=userJson;
                });
                preferences.setString('user', userJson);
              },
              child: Text('Store'),
            ),
           /* SizedBox(height: 32),
            ElevatedButton(
              onPressed: () async {
                String? name = preferences.getString("name");
                if (name == null) return;
                setState(() {
                  this.name = name;
                });
              },
              child: Text('Load'),
            ),*/
          ],
        ),
      ),
    );
  }


}
