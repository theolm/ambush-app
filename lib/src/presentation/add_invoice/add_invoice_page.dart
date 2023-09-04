import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/src/core/di/di.dart';
import 'package:invoice_app/src/core/settings/const.dart';
import 'package:invoice_app/src/core/presenter/components/date_picker.dart';
import 'package:invoice_app/src/core/presenter/components/field_validators.dart';
import 'package:invoice_app/src/domain/models/invoice_flow_data.dart';
import 'package:invoice_app/src/presentation/add_invoice/add_invoice_navigation_flow.dart';
import 'package:invoice_app/src/presentation/settings/base_settings_page.dart';

import 'add_invoice_viewmodel.dart';

@RoutePage()
class AddInvoicePage extends StatelessWidget {
  AddInvoicePage({
    Key? key,
    required this.flow,
  }) : super(key: key);

  final AddInvoiceViewModel _viewModel = getIt();
  AddInvoiceNavigationFlow flow;

  @override
  Widget build(BuildContext context) {
    return BaseSettingsPage(
      title: "New invoice",
      buttonText: "Save invoice",
      onButtonPressed: () async {
        await _onSavePressed();
      },
      form: Form(
        key: _viewModel.formKey,
        child: Column(
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

  Future _onSavePressed() async {
    if (_viewModel.validateForm()) {
      final invoiceFlowData = flow.invoiceFlowData;
      invoiceFlowData.validateData();
      final invoice = _viewModel.getInvoice(
        invoiceFlowData.service!,
        invoiceFlowData.companyInfo!,
        invoiceFlowData.clientInfo!,
        invoiceFlowData.bankInfo!,
      );

      if (invoice == null) return;

      await _viewModel.saveInvoice(invoice);
      flow.onFinishFlow();
    }
  }
}
