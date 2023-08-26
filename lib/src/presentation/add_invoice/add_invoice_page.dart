import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/src/core/di/di.dart';
import 'package:invoice_app/src/core/settings/const.dart';
import 'package:invoice_app/src/core/presenter/components/currency_picker.dart';
import 'package:invoice_app/src/core/presenter/components/date_picker.dart';
import 'package:invoice_app/src/core/presenter/components/field_validators.dart';
import 'package:invoice_app/src/domain/models/bank_info.dart';
import 'package:invoice_app/src/domain/models/client_info.dart';
import 'package:invoice_app/src/domain/models/comp_info.dart';
import 'package:invoice_app/src/domain/models/service_info.dart';

import 'add_invoice_viewmodel.dart';

@RoutePage()
class AddInvoicePage extends StatelessWidget {
  AddInvoicePage({
    Key? key,
    required this.clientInfo,
    required this.companyInfo,
    required this.bankInfo,
    required this.serviceInfo,
  }) : super(key: key);

  final AddInvoiceViewModel _viewModel = getIt();
  final ClientInfo clientInfo;
  final CompanyInfo companyInfo;
  final BankInfo bankInfo;
  final ServiceInfo serviceInfo;

  @override
  Widget build(BuildContext context) {
    final navigator = context.router;
    return Scaffold(
      appBar: AppBar(title: const Text("New invoice")),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await _onSavePressed(navigator);
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
          ],
        ),
      ),
    );
  }

  Future _onSavePressed(StackRouter navigator) async {
    if (_viewModel.validateForm()) {
      final invoice = _viewModel.getInvoice(
        serviceInfo,
        companyInfo,
        clientInfo,
        bankInfo,
      );

      if(invoice == null) return;

      await _viewModel.saveInvoice(invoice);
      navigator.popUntilRoot();
    }
  }
}
