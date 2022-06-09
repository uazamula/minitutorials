import 'package:flutter/material.dart';
import 'package:minitutorials/listview_with_navigator/listview_with_navigator.dart';

class UserPage extends StatelessWidget {
  final User user;

  const UserPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appbar for UserPage'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              user.urlAvatar,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 12),
            Text(user.username),
          ],
        ),
      ),
    );
  }
}
