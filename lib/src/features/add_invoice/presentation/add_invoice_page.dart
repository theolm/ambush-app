import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/src/core/di/di.dart';

import 'add_invoice_viewmodel.dart';

@RoutePage()
class AddInvoicePage extends StatelessWidget {
  AddInvoicePage({Key? key}) : super(key: key);

  final AddInvoiceViewModel _viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New invoice")),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          var res = await _viewModel.saveInvoice();
          print(res.toString());
        },
        label: const Text("Generate Invoice"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: "Invoice ID"),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            controller: _viewModel.idController,
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Issue date",
              hintText: "dd/mm/yyyy",
            ),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.datetime,
            controller: _viewModel.issueDateController,
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Due date",
              hintText: "dd/mm/yyyy",
            ),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.datetime,
            controller: _viewModel.dueDateController,
          ),
        ],
      ),
    );
  }
}
