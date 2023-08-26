import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:invoice_app/src/core/di/di.dart';
import 'package:invoice_app/src/core/domain/const.dart';
import 'package:invoice_app/src/core/presenter/components/field_validators.dart';
import 'package:invoice_app/src/features/settings/presentation/base_settings_page.dart';

import '../save_fab.dart';
import 'bank_info_viewmodel.dart';

@RoutePage()
class BankInfoPage extends StatelessWidget {
  BankInfoPage({Key? key}) : super(key: key);

  final BankInfoViewModel _viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    final navigator = context.router;

    return Observer(
      builder: (context) {
        return BaseSettingsPage(
          title: "Bank information",
          buttonText: "Save",
          switchValue: _viewModel.switchValue,
          onSwitchClicked: _viewModel.setSwitchValue,
          onButtonPressed: () async {
            if (_viewModel.formKey.currentState!.validate()) {
              await _viewModel.saveBankInfo();
              navigator.pop();
            }
          },
          form: Form(
            key: _viewModel.formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration:
                  const InputDecoration(labelText: "Beneficiary name"),
                  textInputAction: TextInputAction.next,
                  controller: _viewModel.beneficiaryNameController,
                  validator: requiredFieldValidator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: marginBetweenFields),
                TextFormField(
                  decoration:
                  const InputDecoration(labelText: "Account number (IBAN)"),
                  textInputAction: TextInputAction.next,
                  controller: _viewModel.ibanController,
                  validator: requiredFieldValidator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: marginBetweenFields),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Swift code"),
                  textInputAction: TextInputAction.next,
                  controller: _viewModel.swiftController,
                  validator: requiredFieldValidator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: marginBetweenFields),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Bank Name"),
                  textInputAction: TextInputAction.next,
                  controller: _viewModel.bankNameController,
                  validator: requiredFieldValidator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: marginBetweenFields),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Bank address"),
                  textInputAction: TextInputAction.next,
                  controller: _viewModel.bankAddressController,
                  maxLines: null,
                  minLines: null,
                  validator: requiredFieldValidator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: bigBetweenFields),
                Row(
                  children: [
                    const Expanded(child: Text("Intermediary bank (optional)")),
                    Switch(
                      value: _viewModel.isIntermediaryBankEnabled,
                      onChanged: (value) {
                        _viewModel.setIntermediaryBankEnabled(value);
                      },
                    ),
                  ],
                ),
                Visibility(
                  visible: _viewModel.isIntermediaryBankEnabled,
                  child: Column(
                    children: [
                      const SizedBox(height: marginBetweenFields),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: "Account number (IBAN)"),
                        textInputAction: TextInputAction.next,
                        controller: _viewModel.intIbanController,
                        validator: _validateIntBank,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const SizedBox(height: marginBetweenFields),
                      TextFormField(
                        decoration:
                        const InputDecoration(labelText: "Swift code"),
                        textInputAction: TextInputAction.next,
                        controller: _viewModel.intSwiftController,
                        validator: _validateIntBank,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const SizedBox(height: marginBetweenFields),
                      TextFormField(
                        decoration:
                        const InputDecoration(labelText: "Bank Name"),
                        textInputAction: TextInputAction.next,
                        controller: _viewModel.intBankNameController,
                        validator: _validateIntBank,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const SizedBox(height: marginBetweenFields),
                      TextFormField(
                        decoration:
                        const InputDecoration(labelText: "Bank address"),
                        maxLines: null,
                        minLines: null,
                        textInputAction: TextInputAction.next,
                        controller: _viewModel.intBankAddressController,
                        validator: _validateIntBank,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  String? _validateIntBank(String? value) {
    if (!_viewModel.isIntermediaryBankEnabled) return null;
    if (value == null || value.isEmpty) {
      return "Required filed";
    }
    return null;
  }
}
