import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
// https://stackoverflow.com/questions/34910686/how-can-i-get-the-current-date-w-o-hour-and-minutes

class MyDateRangePicker extends StatefulWidget {
  const MyDateRangePicker({Key? key}) : super(key: key);

  @override
  _MyDateRangePickerState createState() => _MyDateRangePickerState();
}

class _MyDateRangePickerState extends State<MyDateRangePicker> {
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(2022, 11, 5),
    end: DateTime(2022, 12, 24),
  );

  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    final difference = dateRange.duration;
    initializeDateFormatting('uk',null);


    return Scaffold(
      appBar: AppBar(title: const Text('MyDateRangePicker)')),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Date Range',
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    // child: Text('${start.year}/${start.month}/${start.day}'),
                    child: Text(DateFormat.yMMMMd('uk').format(start)),
                    onPressed: pickDateRange,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                    child: ElevatedButton(
                      // child: Text('${end.year}/${end.month}/${end.day}'),
                      child: Text(DateFormat('dd MMM yy','uk').format(end)),
                  onPressed: pickDateRange,
                )),
              ],
            ),
            SizedBox(height: 16,),
            Text('Difference: ${difference.inDays}')
          ],
        ),
      ),
    );
  }

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await
    showDateRangePicker(
        context: context,
        initialDateRange: dateRange,
        firstDate: DateTime(2020),
        lastDate: DateTime(2100));
    if(newDateRange==null) return; // pressed X
    setState(() {
      dateRange=newDateRange; // pressed SAVE
    });
  }

  @override
  void initState() {
    super.initState();
  }
}
