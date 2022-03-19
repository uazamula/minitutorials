import 'package:flutter/material.dart';

class MyDropDownMenu extends StatefulWidget {
  const MyDropDownMenu({Key? key}) : super(key: key);

  @override
  _MyDropDownMenuState createState() => _MyDropDownMenuState();
}

class _MyDropDownMenuState extends State<MyDropDownMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyDropDownMenu)'),
        actions: [
          PopupMenuButton(
              onSelected: (value){
                switch (value){
                  case MenuItem.item1:
                    print('item1');
                    break;
                  case MenuItem.item2:
                    print('item2');
                    break;
                  case MenuItem.item3:
                    print('item3');
                    break;
                  case MenuItem.item4:
                    print('item4');
                    break;

                }
              },
              itemBuilder: (context) => [
            PopupMenuItem(child: Text('Item1'),value: MenuItem.item1,),
            PopupMenuItem(child: Text('Item2'),value: MenuItem.item2,),
            PopupMenuItem(child: Text('Item3'),value: MenuItem.item3,),
            PopupMenuItem(child: Text('Item4'),value: MenuItem.item4,),

          ]),
        ],
      ),
      body: Center(),
    );
  }
}

enum MenuItem {item1,item2,item3,item4}
