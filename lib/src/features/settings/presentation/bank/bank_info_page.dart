import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/src/core/di/di.dart';
import 'package:invoice_app/src/core/domain/const.dart';

import '../save_fab.dart';
import 'bank_info_viewmodel.dart';

@RoutePage()
class BankInfoPage extends StatelessWidget {
  BankInfoPage({Key? key}) : super(key: key);

  final BankInfoViewModel _viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    final navigator = context.router;
    return Scaffold(
      appBar: AppBar(title: const Text("Bank information")),
      floatingActionButton: SaveFab(
        onClick: () async {
          await _viewModel.saveBankInfo();
          navigator.pop();
        },
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: regularMargin,
          horizontal: regularMargin,
        ),
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: "Beneficiary name"),
            textInputAction: TextInputAction.next,
            controller: _viewModel.beneficiaryNameController,
          ),
          const SizedBox(height: regularBetweenFields),
          TextFormField(
            decoration:
                const InputDecoration(labelText: "Account number (IBAN)"),
            textInputAction: TextInputAction.next,
            controller: _viewModel.ibanController,
          ),
          const SizedBox(height: regularBetweenFields),
          TextFormField(
            decoration: const InputDecoration(labelText: "Swift code"),
            textInputAction: TextInputAction.next,
            controller: _viewModel.swiftController,
          ),
          const SizedBox(height: regularBetweenFields),
          TextFormField(
            decoration: const InputDecoration(labelText: "Bank Name"),
            textInputAction: TextInputAction.next,
            controller: _viewModel.bankNameController,
          ),
          const SizedBox(height: regularBetweenFields),
          TextFormField(
            decoration: const InputDecoration(labelText: "Bank address"),
            textInputAction: TextInputAction.next,
            controller: _viewModel.bankAddressController,
            maxLines: null,
            minLines: null,
          ),
          const SizedBox(height: bigBetweenFields),
          const Text("Intermediary bank (optional)"),
          const SizedBox(height: regularBetweenFields),
          TextFormField(
            decoration:
                const InputDecoration(labelText: "Account number (IBAN)"),
            textInputAction: TextInputAction.next,
            controller: _viewModel.intIbanController,
          ),
          const SizedBox(height: regularBetweenFields),
          TextFormField(
            decoration: const InputDecoration(labelText: "Swift code"),
            textInputAction: TextInputAction.next,
            controller: _viewModel.intSwiftController,
          ),
          const SizedBox(height: regularBetweenFields),
          TextFormField(
            decoration: const InputDecoration(labelText: "Bank Name"),
            textInputAction: TextInputAction.next,
            controller: _viewModel.intBankNameController,
          ),
          const SizedBox(height: regularBetweenFields),
          TextFormField(
            decoration: const InputDecoration(labelText: "Bank address"),
            maxLines: null,
            minLines: null,
            textInputAction: TextInputAction.next,
            controller: _viewModel.intBankAddressController,
          ),
          const SizedBox(height: regularBetweenFields * 5),
        ],
      ),
    );
  }
}
