import 'package:flutter/material.dart';

class InvoiceListPage extends StatelessWidget {
  const InvoiceListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Invoice Generator"), //TODO: isloate strings in local.
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: ListView.separated(
        itemCount: 100,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        separatorBuilder: (_, __) => Container(
          height: 1,
          width: double.infinity,
          color: Colors.black,
        ),
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            alignment: Alignment.centerLeft,
            child: Text("Invoice $index"),
          );
        },
      ),
    );
  }
}
