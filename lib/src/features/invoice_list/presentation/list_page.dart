import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/src/core/presenter/routes/app_route.gr.dart';

class InvoiceListPage extends StatelessWidget {
  const InvoiceListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Invoice Generator"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              context.router.push(SettingsRoute());
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () async {
          context.router.push(AddInvoiceRoute());
        },
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
