import 'package:flutter/material.dart';
import 'package:minitutorials/listview_with_navigator/user_page.dart';

class ListViewWithNavigator extends StatefulWidget {
  const ListViewWithNavigator({Key? key}) : super(key: key);

  @override
  _ListViewWithNavigatorState createState() => _ListViewWithNavigatorState();
}

class _ListViewWithNavigatorState extends State<ListViewWithNavigator> {
  final controller = PageController(initialPage: 0);
  List<String> images = [
    'assets/images/buddha.jpg',
    'assets/images/brailka.jpg',
    'assets/images/alarm.png',
    'assets/images/buddha.jpg',
    'assets/images/brailka.jpg',
    'assets/images/alarm.png',
  ];
  late List<User> users = List.generate(
      images.length,
          (index) =>
          User(
              username: myImage(index),
              email: 'email${index + 1}',
              urlAvatar: images[index]));

  String myImage(int index) =>
      images[index].substring(14, images[index].length - 4);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListViewWithNavigator)'),
        actions: [
          IconButton(
              onPressed: () =>
                  controller.previousPage(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  ),
              icon: Icon(Icons.arrow_left)),
          IconButton(
              onPressed: () =>
                  controller.nextPage(
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
          ListView.builder(
              itemCount: images.length,
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
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => UserPage(
                              user: user),));
                    },
                  ),

                );
              }),
        ],
      ),
    );
  }
}

class User {
  final String username;
  final String email;
  final String urlAvatar;

  User({
    required this.username,
    required this.email,
    required this.urlAvatar,
  });
}
