import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String email;
  final String password;
  HomePage({required this.email,required this.password});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
      child: Column(
          children: [Text(email),Text(password)],
      ),
    ),
        ));
  }
}
