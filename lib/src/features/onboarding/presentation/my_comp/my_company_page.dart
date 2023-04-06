import 'package:flutter/material.dart';

class MyCompanyPage extends StatelessWidget {
  const MyCompanyPage({Key? key}) : super(key: key);

  static const double _spaceBetweenFields = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Company info")),
      floatingActionButton: ElevatedButton(
        onPressed: (){},
        child: const Text('Next'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: "Company name"),
          ),
          Container(height: _spaceBetweenFields),
          TextFormField(
            decoration: const InputDecoration(labelText: "CNPJ"),
          ),
          Container(height: _spaceBetweenFields),
          TextFormField(
            decoration: const InputDecoration(labelText: "Company address"),
            maxLines: 10,
            minLines: 1,
          ),
          Container(height: _spaceBetweenFields),
          TextFormField(
            decoration: const InputDecoration(labelText: "Company address"),
            maxLines: 10,
            minLines: 1,
          ),
        ],
      ),
    );
  }
}
