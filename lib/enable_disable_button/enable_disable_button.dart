import 'package:flutter/material.dart';

class EnableDisableButton extends StatefulWidget {
  const EnableDisableButton({Key? key}) : super(key: key);

  @override
  _EnableDisableButtonState createState() => _EnableDisableButtonState();
}

class _EnableDisableButtonState extends State<EnableDisableButton> {
  bool isButtonActive = true;
 late TextEditingController controller;


  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.addListener(() {
      final isButtonActive = controller.text.isNotEmpty;
      setState(() {
        this.isButtonActive = isButtonActive;
      });
    });
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('EnableDisableButton)')),
      body: ListView(
        padding: EdgeInsets.all(24),
        children: [
          TextField(
            decoration: InputDecoration(
              label: Text('Name'),
              border: OutlineInputBorder(),
            ),
            controller: controller,
          ),
          SizedBox(height: 16,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                onSurface: Colors.blue,
              ),
              onPressed: isButtonActive ? () {
                setState(() {
                  isButtonActive = false;
                });
                controller.clear();
              } : null,
              child: Text('Submit'))
        ],
      ),
    );
  }
}
