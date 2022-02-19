import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyTimePicker extends StatefulWidget {
  const MyTimePicker({Key? key}) : super(key: key);

  @override
  _MyTimePickerState createState() => _MyTimePickerState();
}

class _MyTimePickerState extends State<MyTimePicker> {
  TimeOfDay time =
      TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);// ! in device (it can be an Emulator)

  @override
  Widget build(BuildContext context) {
    final minutes = time.minute.toString().padLeft(2, '0');

    return Scaffold(
      appBar: AppBar(title: const Text('MyTimePicker)')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${time.hour}:$minutes',
              style: TextStyle(fontSize: 32),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () async {
                  TimeOfDay? newTime =
                      await showTimePicker(context: context, initialTime: time);
                  if (newTime == null) return; //pressed CANCEL

                  setState(() {
                    time = newTime;
                  });
                },
                child: Text('Select Time'))
          ],
        ),
      ),
    );
  }
}
