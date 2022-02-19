import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

// flutter_markdown: ^0.6.9
// url_launcher: ^6.0.20

class MyMarkDownWidget extends StatefulWidget {
  const MyMarkDownWidget({Key? key}) : super(key: key);

  @override
  _TemplateState createState() => _TemplateState();
}

class _TemplateState extends State<MyMarkDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MarkDown Widget)')),
      body: Markdown(
        selectable: true,
        onTapLink: (text,href,title){
          href!=null?launch(href):null;
        },
        data: '''
Lorem ipsum dolor sit amet
      
# Heading h1
## Heading h2
###### Heading h6

*italic*  
_italic too_

**bold**
__bold too__

***italic and bold***  
___don't forget make double space to start with a new row___
      
CheckOut [Flutter](https://flutter.dev/)      

## Unordered List  
* Item1
* Item2
* Item3
* Item4
* Item5

## Ordered List  
1. Item1
1. Item2
1. Item3
1. Item4
1. Item5

![Alt](https://upload.wikimedia.org/wikipedia/commons/b/bd/Saint_Juliania_Olshanska.jpg)
      ''',),
    );
  }
}
