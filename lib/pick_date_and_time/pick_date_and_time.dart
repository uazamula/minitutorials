import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
// https://stackoverflow.com/questions/54299659/flutter-datetime-now-not-same-in-my-local-time
class MyPickDateAndTime extends StatefulWidget {
  const MyPickDateAndTime({Key? key}) : super(key: key);

  @override
  _MyPickDateAndTimeState createState() => _MyPickDateAndTimeState();
}

class _MyPickDateAndTimeState extends State<MyPickDateAndTime> {
  DateTime dateTime = DateTime(2022, 12, 24, 5, 45);

  @override
  Widget build(BuildContext context) {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    initializeDateFormatting('uk', null);

    return Scaffold(
      // appBar: AppBar(title: const Text('MyPickDateAndTime)')),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
                child: Text('Date and Time', style: TextStyle(fontSize: 28))),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  onPressed: () async {
                    final date = await pickDate();
                    if (date == null) return; // pressed CANCEL
                    // setState(() { dateTime = date;});// pressed OK
                    final newDateTime = DateTime(
                      date.year,
                      date.month,
                      date.day,
                      dateTime.hour,
                      dateTime.minute,
                    );
                    setState(() {
                      dateTime = newDateTime; // pressed OK
                    });
                  },
                  child: Text(DateFormat('dd MMM yy', 'uk').format(dateTime)),
                )),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      final time = await pickTime();
                      if (time == null) return; // pressed CANCEL
                      final newDateTime = DateTime(
                        dateTime.year,
                        dateTime.month,
                        dateTime.day,
                        time.hour,
                        time.minute,
                      );
                      setState(() {
                        dateTime = newDateTime; // pressed OK
                      });
                    },
                    child: Text('$hours:$minutes'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: pickDateTime,
                child: Text(
                    '${DateFormat('dd MMM yy', 'uk').format(dateTime)} р.  '
                        ' ${dateTime.hour}:${dateTime.minute}'))
          ],
        ),
      ),
    );
  }

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025));

  Future<TimeOfDay?> pickTime() => showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
      );
  Future pickDateTime() async{
    DateTime? date = await pickDate();
    if (date == null) return; // pressed CANCEL
    TimeOfDay? time = await pickTime();
    if (time == null) return; // pressed CANCEL

    final dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    setState(() {
      this.dateTime = dateTime;
    });
  }
}
