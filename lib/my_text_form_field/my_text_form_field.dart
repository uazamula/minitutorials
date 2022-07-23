import 'dart:html';

import 'package:flutter/material.dart';

class MyTextFormField extends StatefulWidget {
  const MyTextFormField({Key? key}) : super(key: key);

  @override
  _MyTextFormFieldState createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  final formKey = GlobalKey<FormState>();
  String? userName = '';
  String? email = '';
  String? password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyTextFormField)'),
      ),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            buildUserName(),
            SizedBox(height: 16),
            buildEmail(),
            SizedBox(height: 16),
            buildPassword(),
            SizedBox(height: 16),
            buildSubmit(),
          ],
        ),
      ),
    );
  }

  Widget buildUserName() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'UserName',
          border: OutlineInputBorder(),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.purple),
          ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.amber),
      ),
      errorStyle: TextStyle(color: Colors.pinkAccent)),

      validator: (value) {
        if (value!.length < 4) {
          return 'Enter at least 4 characters';
        } else {
          return null;
        }
      },
      maxLength: 15,
      onSaved: (value) => setState(() => userName = value),
    );
  }

  Widget buildEmail() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        final pattern = r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$';
        final regExp = RegExp(pattern);
        if(value!.isEmpty){
          return 'Enter an email';
        } else if (!regExp.hasMatch(value!)) {
          return 'Enter a valid email';
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) => setState(() => email = value),
    );
  }

  Widget buildPassword() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value!.length < 7) {
          return 'Password must be at least 7 characters long';
        } else {
          return null;
        }
      },
      onSaved: (value) => setState(() => password = value),
      obscureText: true,
    );
  }

  Widget buildSubmit() {
    return ElevatedButton(
      child: Text('Submit'),
      onPressed: () {
        final bool isValid = formKey.currentState!.validate();
        Focus.of(context).unfocus();

        if (isValid) {
          formKey.currentState!.save();
          final message =
              'UserName: $userName\nPassword: $password\nEmail: $email';
          final snackBar = SnackBar(
            content: Text(
              message,
              style: TextStyle(fontSize: 20),
            ),
            backgroundColor: Colors.green,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
    );
  }
}
