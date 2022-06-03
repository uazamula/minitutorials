import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:translator/translator.dart';
import 'package:http/http.dart' as http;

//   translator: ^0.1.7
//   http: ^0.13.4
//   html_unescape: ^2.0.0
class MyGoogleTranslate extends StatefulWidget {
  const MyGoogleTranslate({Key? key}) : super(key: key);

  @override
  _MyGoogleTranslateState createState() => _MyGoogleTranslateState();
}

class _MyGoogleTranslateState extends State<MyGoogleTranslate> {
  final controller = PageController(initialPage: 0);
  String translated = 'Translation';

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyGoogleTranslate)'),
        actions: [
          IconButton(
              onPressed: () => controller.previousPage(
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
              ),
              icon: Icon(Icons.arrow_left)),
          IconButton(
              onPressed: () => controller.nextPage(
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
              ),
              icon: Icon(Icons.arrow_right)),
        ],
      ),
      body: PageView(
        // physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          buildCard('en'),
          buildCard('auto'),
          buildCardWithApi(),
        ],
      ),
    );
  }

  Widget buildCardWithApi() {
    return Card(
          margin: EdgeInsets.all(12),
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              Text('english'),
              SizedBox(height: 8),
              TextField(
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  hintText: 'Enter text in production version',
                ),
                onChanged: (text)async{
                  // https://console.cloud.google.com/marketplace/product/google/translate.googleapis.com
                  // or
                  // https://bit.ly/goCTA
                  // Enable-> Credentials->Create Credentials-> API key->copy->paste below
                  const apiKey = 'qtehgwhwfhesfhjwsfjew';

                  const to = 'es';
                  final url = Uri.parse('https://translation.googleapis.com/language/translate/v2''?q=$text&target=$to&key=$apiKey',);
                  final response = await http.post(url);
                  if (response.statusCode == 200){
                    final body = json.decode(response.body);
                    final translations = body['data']['translations'] as List;
                    final translation = HtmlUnescape().convert(
                      translations.first['translatedText'],

                    );
                    // final translation = await text.translate(//https://www.andiamo.co.uk/resources/iso-language-codes/
                    //   from: 'en',
                    //   to: 'es',
                    // );
                    setState(() {
                      translated = translation;
                    });}
                  else
                    {
                      setState(() {
                        translated='Error';
                      });
                    }


                },
              ),
              Divider(height: 32),
              Text(
                translated,
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        );
  }

  Widget buildCard(String languageISO) {
    return Card(
          margin: EdgeInsets.all(12),
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              Text(languageISO),
              SizedBox(height: 8),
              TextField(
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                hintText: 'Enter text',
              ),
                onChanged: (text)async{
                final translation = await text.translate(//https://www.andiamo.co.uk/resources/iso-language-codes/
                  from: languageISO,
                  to: 'es',
                );
                setState(() {
                  translated = translation.text;
                });
                },
              ),
              Divider(height: 32),
              Text(
                translated,
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        );
  }
}