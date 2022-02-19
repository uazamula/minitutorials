import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class MyFormatDateTimeTimeAgoLocales extends StatefulWidget {
  const MyFormatDateTimeTimeAgoLocales({Key? key}) : super(key: key);

  @override
  _MyFormatDateTimeTimeAgoLocalesState createState() => _MyFormatDateTimeTimeAgoLocalesState();
}

class _MyFormatDateTimeTimeAgoLocalesState extends State<MyFormatDateTimeTimeAgoLocales> {
  @override
  Widget build(BuildContext context) {
    DateTime minAgo = DateTime.now().subtract(Duration(minutes: 1));
    DateTime dayAgo = DateTime.now().subtract(Duration(days: 1));
    DateTime monthAgo = DateTime.now().subtract(Duration(days: 31));

    return Scaffold(
      appBar: AppBar(title: const Text('Time Ago Locales)')),
      body: ListView(
        padding: const EdgeInsets.all(32),
        children: [
          Text(timeago.format(minAgo, locale: 'en_short')),
          Text(timeago.format(dayAgo, locale: 'en_short')),
          Text(timeago.format(monthAgo, locale: 'en_short')),

          SizedBox(height: 20,),

          Text(timeago.format(minAgo, locale: 'uk')),
          Text(timeago.format(dayAgo, locale: 'uk')),
          Text(timeago.format(monthAgo, locale: 'uk')),

          SizedBox(height: 20,),

          Text(timeago.format(minAgo, locale: 'uk_short')),
          Text(timeago.format(dayAgo, locale: 'uk_short')),
          Text(timeago.format(monthAgo, locale: 'uk_short')),

          SizedBox(height: 20,),

          Text(timeago.format(minAgo, locale: 'de')),
          Text(timeago.format(dayAgo, locale: 'de_short')),

        ],
      ),
    );
  }

  @override
  void initState() {
    timeago.setLocaleMessages('uk', timeago.UkMessages());
    timeago.setLocaleMessages('uk_short', timeago.UkShortMessages());
  }
}
