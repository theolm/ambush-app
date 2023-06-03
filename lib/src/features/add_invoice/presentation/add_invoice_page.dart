import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/src/core/di/di.dart';
import 'package:invoice_app/src/core/domain/const.dart';
import 'package:invoice_app/src/core/presenter/components/currency_picker.dart';
import 'package:invoice_app/src/core/presenter/components/date_picker.dart';
import 'package:invoice_app/src/core/presenter/components/field_validators.dart';

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
          if (_viewModel.validateForm()) {
            await _viewModel.saveInvoice();
            navigator.pop();
          }
        },
        label: const Text("Generate Invoice"),
      ),
      body: Form(
        key: _viewModel.formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: "Invoice ID"),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              controller: _viewModel.idController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: requiredFieldValidator,
            ),
            const SizedBox(height: marginBetweenFields),
            TextFormField(
              controller: _viewModel.issueDateController,
              decoration: const InputDecoration(
                labelText: "Issue date",
              ),
              readOnly: true,
              keyboardType: TextInputType.none,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onTap: () async {
                var date = await selectDate(context, null);
                if (date != null) {
                  _viewModel.updateIssueDate(date);
                }
              },
              validator: requiredFieldValidator,
            ),
            const SizedBox(height: marginBetweenFields),
            TextFormField(
              controller: _viewModel.dueDateController,
              decoration: const InputDecoration(
                labelText: "Due date",
              ),
              readOnly: true,
              keyboardType: TextInputType.none,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onTap: () async {
                var date = await selectDate(context, null);
                if (date != null) {
                  _viewModel.updateDueDate(date);
                }
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please inform a date';
                }

                if (!_viewModel.isDueDateValid()) {
                  return "The due date cannot be before the issue date";
                }
                return null;
              },
            ),
            const SizedBox(height: marginBetweenFields),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Service description",
                hintText: "e.g. Software Development",
              ),
              validator: requiredFieldValidator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textInputAction: TextInputAction.next,
              controller: _viewModel.serviceController,
            ),
            const SizedBox(height: marginBetweenFields),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Quantity",
                hintText: "e.g. 1.00",
              ),
              validator: doubleValueValidator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              controller: _viewModel.quantityController,
            ),
            const SizedBox(height: marginBetweenFields),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Currency",
              ),
              readOnly: true,
              validator: requiredFieldValidator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.none,
              controller: _viewModel.currencyController,
              onTap: () async {
                var selected = await selectCurrency(
                  context,
                  await getCurrencyList(),
                  _viewModel.initialCurrency?.cc,
                );

                if (selected != null) {
                  _viewModel.setSelectedCurrency(selected);
                }
              },
            ),
            const SizedBox(height: marginBetweenFields),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Unit price",
                hintText: "e.g. 5000.00",
              ),
              validator: doubleValueValidator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              controller: _viewModel.priceController,
            ),
          ],
        ),
      ),
    );
  }
}
