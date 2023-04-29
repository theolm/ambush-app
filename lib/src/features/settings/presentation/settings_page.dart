import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/src/core/presenter/routes/app_route.gr.dart';
import 'package:invoice_app/src/features/settings/presentation/SettingsItem.dart';
import 'package:invoice_app/src/features/settings/presentation/settings_viewmodel.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/di/di.dart';

const _bigSpacer = 24.0;
const _mediumSpacer = 16.0;

@RoutePage()
class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);

  final SettingsViewModel _viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: Observer(builder: (_) {
        return ListView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          children: [
            SettingsItem(
              title: "Basic information",
              subtitle: "Add basic information about your company",
              onClick: () {
                context.router.push(BasicInfoRoute());
              },
            ),
            const Divider(indent: 16, endIndent: 16),
            SettingsItem(
              title: "Bank information",
              subtitle: "Add your bank account information",
              onClick: () {
                context.router.push(BankInfoRoute());
              },
            ),
            const Divider(indent: 16, endIndent: 16),
            SettingsItem(
              title: "Service information",
              subtitle: "Add information about the services that you provided",
              onClick: () {
                context.router.push(ServiceInfoRoute());
              },
            ),
            const Divider(indent: 16, endIndent: 16),
            SettingsItem(
              title: "Client information",
              subtitle: "Add information about your client",
              onClick: () {
                context.router.push(ClientInfoRoute());
              },
            ),
          ],
          // children: [
          //   Text(
          //     "Basic information",
          //     style: textTheme.headlineSmall,
          //   ),
          //   const SizedBox(height: _bigSpacer),
          //   TextFormField(
          //     decoration: const InputDecoration(labelText: "Company name"),
          //     textInputAction: TextInputAction.done,
          //     controller: _viewModel.compNameController,
          //     onFieldSubmitted: (value) {
          //       _viewModel.updateCompanyName(value);
          //     },
          //   ),
          //   const SizedBox(height: _mediumSpacer),
          //   TextFormField(
          //     decoration: const InputDecoration(labelText: "Company address"),
          //     textInputAction: TextInputAction.done,
          //     controller: _viewModel.compAddressController,
          //     onFieldSubmitted: (value) {
          //       _viewModel.updateCompanyAddress(value);
          //     },
          //   ),
          //   const SizedBox(height: _bigSpacer),
          //   Text(
          //     "Account information",
          //     style: textTheme.headlineSmall,
          //   ),
          //   const SizedBox(height: _bigSpacer),
          //   TextFormField(
          //     decoration: const InputDecoration(labelText: "Beneficiary name"),
          //     textInputAction: TextInputAction.done,
          //     controller: _viewModel.beneficiaryNameController,
          //     onFieldSubmitted: (value) {
          //       _viewModel.updateBankInfo();
          //     },
          //   ),
          //   const SizedBox(height: _mediumSpacer),
          //   TextFormField(
          //     decoration: const InputDecoration(labelText: "IBAN"),
          //     textInputAction: TextInputAction.done,
          //     controller: _viewModel.ibanController,
          //     onFieldSubmitted: (value) {
          //       _viewModel.updateBankInfo();
          //     },
          //   ),
          //   const SizedBox(height: _mediumSpacer),
          //   TextFormField(
          //     decoration: const InputDecoration(labelText: "SWIFT Code"),
          //     textInputAction: TextInputAction.done,
          //     controller: _viewModel.swiftController,
          //     onFieldSubmitted: (value) {
          //       _viewModel.updateBankInfo();
          //     },
          //   ),
          //   const SizedBox(height: _mediumSpacer),
          //   TextFormField(
          //     decoration: const InputDecoration(labelText: "Bank Name"),
          //     textInputAction: TextInputAction.done,
          //     controller: _viewModel.bankNameController,
          //     onFieldSubmitted: (value) {
          //       _viewModel.updateBankInfo();
          //     },
          //   ),
          //   const SizedBox(height: _mediumSpacer),
          //   TextFormField(
          //     decoration: const InputDecoration(labelText: "Bank Address"),
          //     textInputAction: TextInputAction.done,
          //     controller: _viewModel.bankAddressController,
          //     onFieldSubmitted: (value) {
          //       _viewModel.updateBankInfo();
          //     },
          //   ),
          //   const SizedBox(height: _mediumSpacer),
          //   TextFormField(
          //     decoration: const InputDecoration(labelText: "(optional) Intermediary SWIFT Code"),
          //     textInputAction: TextInputAction.done,
          //     controller: _viewModel.intSwiftController,
          //     onFieldSubmitted: (value) {
          //       _viewModel.updateBankInfo();
          //     },
          //   ),
          //   const SizedBox(height: _mediumSpacer),
          //   TextFormField(
          //     decoration: const InputDecoration(labelText: "(optional) Intermediary Bank Name"),
          //     textInputAction: TextInputAction.done,
          //     controller: _viewModel.intBankNameController,
          //     onFieldSubmitted: (value) {
          //       _viewModel.updateBankInfo();
          //     },
          //   ),
          //   const SizedBox(height: _mediumSpacer),
          //   TextFormField(
          //     decoration: const InputDecoration(labelText: "(optional) Intermediary Bank Address"),
          //     textInputAction: TextInputAction.done,
          //     controller: _viewModel.intBankAddressController,
          //     onFieldSubmitted: (value) {
          //       _viewModel.updateBankInfo();
          //     },
          //   ),
          //   const SizedBox(height: _mediumSpacer),
          //   TextFormField(
          //     decoration: const InputDecoration(labelText: "(optional) Intermediary IBAN"),
          //     textInputAction: TextInputAction.done,
          //     controller: _viewModel.intIbanController,
          //     onFieldSubmitted: (value) {
          //       _viewModel.updateBankInfo();
          //     },
          //   ),
          //   const SizedBox(height: _bigSpacer),
          // ],
        );
      }),
    );
  }
}
