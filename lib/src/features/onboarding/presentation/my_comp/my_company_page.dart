import 'package:flutter/material.dart';

class MyCompanyPage extends StatelessWidget {
  const MyCompanyPage({Key? key}) : super(key: key);

  static const double _spaceBetweenFields = 16;
  static final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Company info")),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          _formKey.currentState!.validate();
        },
        child: const Text('Next'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: "Company name"),
              textInputAction: TextInputAction.next,
              validator: _mandatoryFieldValidator,
            ),
            Container(height: _spaceBetweenFields),
            TextFormField(
              decoration: const InputDecoration(labelText: "Company address"),
              maxLines: 10,
              minLines: 1,
              textInputAction: TextInputAction.next,
              validator: _mandatoryFieldValidator,
            ),
            Container(height: _spaceBetweenFields),
            TextFormField(
              decoration: const InputDecoration(labelText: "Company address"),
              maxLines: 10,
              minLines: 1,
              textInputAction: TextInputAction.done,
              validator: _mandatoryFieldValidator,
            ),
          ],
        ),
      ),
    );
  }

  String? _mandatoryFieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is mandatory';
    }
    return null;
  }
}
