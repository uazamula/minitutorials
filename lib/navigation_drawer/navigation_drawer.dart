import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minitutorials/navigation_drawer/favourites_page.dart';

class MyNavigationDrawer extends StatefulWidget {
  const MyNavigationDrawer({Key? key}) : super(key: key);

  @override
  _MyNavigationDrawerState createState() => _MyNavigationDrawerState();
}

class _MyNavigationDrawerState extends State<MyNavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyNavigationDrawer)'),
        backgroundColor: Colors.blue.shade700,
      ),
      drawer: NavigationDrawer(),
      body: Container(),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) => Material(
        color: Colors.blue.shade700,
        child: InkWell(
          onTap: () {
            Navigator.pop(context); //close drawer before
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => UserPage()));
          },
          child: Container(
            // color: Colors.blue.shade700,
            padding: EdgeInsets.only(
              top: 24 + MediaQuery.of(context).padding.top,
              bottom: 24,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 52,
                  backgroundImage: AssetImage('assets/images/brailka.jpg'),
                ),
                SizedBox(height: 12),
                Text('Imiarek')
              ],
            ),
          ),
        ),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        padding: EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
              leading: Icon(Icons.home_outlined),
              title: Text('Home'),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => MyNavigationDrawer()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite_border),
              title: Text('Favourites'),
              onTap: () {
                Navigator.pop(context); //close Drawer before
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => FavouritesPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.workspaces_outline),
              title: Text('Workflow'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.update),
              title: Text('Updates'),
              onTap: () {},
            ),
            Divider(
              color: Colors.black54,
            ),
            ListTile(
              leading: Icon(Icons.account_tree_outlined),
              title: Text('Plugins'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.notifications_outlined),
              title: Text('Notifications'),
              onTap: () {},
            ),
          ],
        ),
      );
}

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
      ),
      body: Image.asset('assets/images/brailka.jpg'),
    );
  }
}
