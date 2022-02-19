import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class MyDatePicker extends StatefulWidget {
  const MyDatePicker({Key? key}) : super(key: key);

  @override
  _MyDatePickerState createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  DateTime date = DateTime(2022, 1, 24);

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('uk', null); // obligatorisch fuer Locales!

    return Scaffold(
      appBar: AppBar(title: const Text('MyDatePicker)')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat('y/M/d').format(date),
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () async {
                  DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: DateTime(2021),
                      lastDate: DateTime(2023));
                  if (newDate == null) return; // pressed CANCEL
                  setState(() {
                    date = newDate; // pressed OK
                  });
                },
                child: Text(DateFormat.yMMMMd('uk').format(date)))
          ],
        ),
      ),
    );
  }
}
