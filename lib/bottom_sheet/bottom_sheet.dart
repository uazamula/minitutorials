import 'package:flutter/material.dart';

class MyBottomSheet extends StatefulWidget {
  const MyBottomSheet({Key? key}) : super(key: key);

  @override
  _TemplateState createState() => _TemplateState();
}

class _TemplateState extends State<MyBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bottom Sheet)')),
      body: Center(
        child: ElevatedButton(
          child: Text('Open Bottom Sheet'),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20)
                  )
                ),
                builder: (context) => SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        Image.asset('assets/images/buddha.jpg',height: 150,),
                        const SizedBox(height: 10,),
                        Image.asset('assets/images/buddha.jpg'),

                        Center(
                              child: ElevatedButton(
                                child: Text('Close'),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),
                      ],
                    ),
                  ),
                ));
          },
        ),
      ),
    );
  }
}
