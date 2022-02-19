import 'package:flutter/material.dart';

class MyTableWidget extends StatefulWidget {
  const MyTableWidget({Key? key}) : super(key: key);

  @override
  _MyTableWidgetState createState() => _MyTableWidgetState();
}

class _MyTableWidgetState extends State<MyTableWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MyTableWidget)')),
      body: Center(
        child: Table(
          border: TableBorder.all(),
          columnWidths: const {
            // 0,5 + 0,25 + 0,25 = 1
            0: FractionColumnWidth(0.5),// 1st column
            1: FractionColumnWidth(0.25),// 2nd column
            2: FractionColumnWidth(0.25),// 3rd column
          },
          children: [
            buildRow(['Cell1', 'Cell2', 'Cell3'], isHeader: true),
            buildRow(['Cell122', 'Cel', 'Ce']),
            buildRow(['Cel1', 'Cel2', 'Cel']),
          ],
        ),
      ),
    );
  }

  TableRow buildRow(List<String> cells, {bool isHeader = false}) => TableRow(

          children: cells.map((cell) {
        final style = TextStyle(
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text(cell, style: style,)),
        );
      }).toList());
}
