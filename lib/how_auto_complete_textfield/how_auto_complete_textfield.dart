import 'package:flutter/material.dart';

class HowAutocompleteTextField extends StatefulWidget {
  const HowAutocompleteTextField({Key? key}) : super(key: key);

  @override
  _HowAutocompleteTextFieldState createState() =>
      _HowAutocompleteTextFieldState();
}

class _HowAutocompleteTextFieldState extends State<HowAutocompleteTextField> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HowAutocompleteTextField)')),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
              keyboardType: TextInputType.name,
              autofillHints: [AutofillHints.name],
            ),
            AutofillGroup(
              child: Column(
                children: [
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(labelText: 'Username'),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    autofillHints: [AutofillHints.username],
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    keyboardType: TextInputType.visiblePassword,
                    autofillHints: [AutofillHints.password],
                    onEditingComplete: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
