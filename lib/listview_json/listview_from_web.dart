import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:minitutorials/listview_json/user.dart';
//https://stackoverflow.com/questions/65630743/how-to-solve-flutter-web-api-cors-error-only-with-dart-code
// http: ^0.13.4
class ListViewJSONfromWeb extends StatefulWidget {
  const ListViewJSONfromWeb({Key? key}) : super(key: key);

  @override
  _ListViewJSONfromWebState createState() => _ListViewJSONfromWebState();
}

class _ListViewJSONfromWebState extends State<ListViewJSONfromWeb> {

  Future<List<User>> usersFuture= getUsers();

  static Future<List<User>> getUsers() async {
    const url =
        'https://github.com/uazamula/minitutorials/blob/master/assets/jsons/users_listview_json.json';
    final response = await get(Uri.parse(url));
    final body = json.decode(response.body);
    return body.map<User>(User.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListViewJSON from web)'),
      ),
      body: Center(
          child: FutureBuilder<List<User>>(
              future: usersFuture,
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return CircularProgressIndicator();
                } else if (snapshot.hasError){
                  return Text('${snapshot.error}');
                }
                else if (snapshot.hasData) {
                  final users = snapshot.data!;
                  return buildUsers(users);
                } else {
                  print('=============${usersFuture}');
                  return Text('No user data.');
                }
              })),
    );
  }

  Widget buildUsers(List<User> users) {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage(user.urlAvatar),
              ),
              title: Text(user.username),
              subtitle: Text(user.email),
              trailing: Icon(Icons.arrow_forward),
            ),
          );
        });
  }
}
