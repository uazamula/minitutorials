import 'package:flutter/material.dart';

class DropDownMenuItemList extends StatefulWidget {
  const DropDownMenuItemList({Key? key}) : super(key: key);

  @override
  State<DropDownMenuItemList> createState() => _DropDownMenuItemListState();
}

class _DropDownMenuItemListState extends State<DropDownMenuItemList> {
  static List<String> items =['item1','item2','item3',];
  String? selectedItem = items[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DropDown Menu Item List'),
      ),
      body:  Center(
        child: SizedBox(
          width: 240,
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(width: 3,color: Colors.blue)
              )
            ),
            value: selectedItem,
            items: items.map((item) => DropdownMenuItem(value:item, child: Text(item))).toList(),
            onChanged: (item)=>setState(() {
              selectedItem=item;
            }),
          ),
        )
         ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
