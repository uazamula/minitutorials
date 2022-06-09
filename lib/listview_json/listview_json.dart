import 'package:flutter/material.dart';
import 'package:minitutorials/listview_json/user.dart';
// http: ^0.13.4
class ListViewJSON extends StatefulWidget {
  const ListViewJSON({Key? key}) : super(key: key);

  @override
  _ListViewJSONState createState() => _ListViewJSONState();
}

class _ListViewJSONState extends State<ListViewJSON> {
  final controller = PageController(initialPage: 0);
  static const List<String> images = [
    'assets/images/buddha.jpg',
    'assets/images/brailka.jpg',
    'assets/images/alarm.png',
    'assets/images/buddha.jpg',
    'assets/images/brailka.jpg',
    'assets/images/alarm.png',
  ];

  // Future<List<User>> usersFromNet = getUsersFromNet();
  // static Future<List<User>> getUsersFromNet() async{
  //   return Text('data');
  //
  // }


    List<User> users = getUsers();

  static List<User> getUsers() {
    final List<Map<String, dynamic>> data = List.generate(
        images.length,
        (index) => {
              "username": images[index].substring(14, images[index].length - 4),
              "email": 'email${index + 1}',
              "urlAvatar": images[index]
            });
    print(data);
    return data.map((e) => User.fromJson(e)).toList();
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
        title: const Text('ListViewJSON)'),
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
          Center(
            child: buildUsers(users),
          ),
        ],
      ),
    );
  }

  Widget buildUsers(List<User> users) {
    return ListView.builder(
      itemCount: users.length, itemBuilder: (context, index) {
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
