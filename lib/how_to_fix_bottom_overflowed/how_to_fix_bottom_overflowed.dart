import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class HowToFixBottomOverflowed extends StatefulWidget {
  const HowToFixBottomOverflowed({Key? key}) : super(key: key);

  @override
  _HowToFixBottomOverflowedState createState() =>
      _HowToFixBottomOverflowedState();
}

class _HowToFixBottomOverflowedState extends State<HowToFixBottomOverflowed> {
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HowToFixBottomOverflowed)')),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/buddha.jpg'),
            fit: BoxFit.cover,
          )),
          child: SingleChildScrollView(
            reverse: true,
            padding: EdgeInsets.all(32),
            child: Column(
              children: [
                Image.asset('assets/images/buddha.jpg'),
                SizedBox(
                  height: 32,
                ),
                buildTextFormField(),
                SizedBox(
                  height: 32,
                ),
                Image.asset(
                  'assets/images/buddha.jpg',
                  height: 150,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField buildTextFormField() {
    return TextFormField(
      obscureText: false,
      decoration: const InputDecoration(
          prefixIcon: Icon(Icons.mail),
          labelText: 'Email',
          border: OutlineInputBorder()),
      validator: (email) {
        if (email != null && !EmailValidator.validate(email)) {
          return 'Enter valid email';
        } else {
          return null;
        }
      },
      onChanged: (value) => setState(() {
        email = value;
      }),
    );
  }
}
