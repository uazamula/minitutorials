import 'package:flutter/material.dart';
import 'package:minitutorials/navigation_drawer/navigation_drawer.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favourites')),
      // drawer: MyNavigationDrawer(),
    );
  }
}
