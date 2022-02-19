import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:minitutorials/validate_forms/home_page.dart';

class ValidateForms extends StatefulWidget {
  const ValidateForms({Key? key}) : super(key: key);

  @override
  _ValidateFormsState createState() => _ValidateFormsState();
}

class _ValidateFormsState extends State<ValidateForms> {
  String email = '';
  String password = '';

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Login Form'),),
        body: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              TextFormField(
                obscureText: false,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.mail),
                    labelText: 'Email',
                    border: OutlineInputBorder()
                ),
                validator: (email) {
                  if (email != null && !EmailValidator.validate(email)) {
                    return 'Enter valid email';
                  }
                  else {
                    return null;
                  }
                },
                onChanged: (value) =>
                    setState(() {
                      email = value;
                    }),
              ),
              const SizedBox(height: 32,),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Password',
                    border: OutlineInputBorder()
                ),
                validator: (value) {
                  if (value != null && value.length < 7) {
                    return 'Enter min 7 characters';
                  }
                  else {
                    return null;
                  }
                },
                onChanged: (value) =>
                    setState(() {
                      password = value;
                    }),
              ),
              const SizedBox(height: 32,),
              ElevatedButton(onPressed: () {
                final isValidForm = formKey.currentState!.validate();
                if (isValidForm) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) =>
                          HomePage(email: email, password: password,),),
                          (route) => false);
              }
              }, child: const Text('Submit'))

            ],
          ),
        ));
  }
}
