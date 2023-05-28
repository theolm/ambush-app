import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/src/core/di/di.dart';
import 'package:invoice_app/src/core/presenter/components/date_picker.dart';

import 'add_invoice_viewmodel.dart';

@RoutePage()
class AddInvoicePage extends StatelessWidget {
  AddInvoicePage({Key? key}) : super(key: key);

  final AddInvoiceViewModel _viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    final navigator = context.router;
    return Scaffold(
      appBar: AppBar(title: const Text("New invoice")),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await _viewModel.saveInvoice();
          navigator.pop();
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
            controller: _viewModel.issueDateController,
            decoration: const InputDecoration(
              labelText: "Issue date",
            ),
            readOnly: true,
            keyboardType: TextInputType.none,
            onTap: () async {
              var date = await selectDate(context, null);
              if (date != null) {
                _viewModel.updateIssueDate(date);
              }
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _viewModel.dueDateController,
            decoration: const InputDecoration(
              labelText: "Due date",
            ),
            readOnly: true,
            keyboardType: TextInputType.none,
            onTap: () async {
              var date = await selectDate(context, null);
              if (date != null) {
                _viewModel.updateDueDate(date);
              }
            },
          ),
        ],
      ),
    );
  }
}
