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
              hintText: "mm/dd/yyyy",
            ),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.datetime,
            controller: _viewModel.issueDateController,
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Due date",
              hintText: "mm/dd/yyyy",
            ),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.datetime,
            controller: _viewModel.dueDateController,
          ),
          const SizedBox(height: 24),
          TextFormField(
            decoration: const InputDecoration(labelText: "Service Description"),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            controller: _viewModel.serviceController,
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(labelText: "Unit price"),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            controller: _viewModel.priceController,
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(labelText: "Quantity"),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            controller: _viewModel.quantityController,
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {
              _viewModel.generateInvoice();
            },
            child: const Text("Generate Invoice"),
          ),
        ],
      ),
    );
  }
}
