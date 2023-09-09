import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:invoice_app/src/core/di/di.dart';
import 'package:invoice_app/src/core/settings/const.dart';
import 'package:invoice_app/src/core/presenter/components/field_validators.dart';
import 'package:invoice_app/src/designsystem/inputfield.dart';
import 'package:invoice_app/src/designsystem/switch.dart';
import 'package:invoice_app/src/presentation/add_invoice/add_invoice_navigation_flow.dart';
import 'package:invoice_app/src/presentation/settings/info_navigation_flow.dart';

import '../base_settings_page.dart';
import 'bank_info_viewmodel.dart';

@RoutePage()
class BankInfoPage extends StatelessWidget {
  BankInfoPage({
    Key? key,
    this.flow,
    required this.screenConfig,
  }) : super(key: key);

  final BankInfoViewModel _viewModel = getIt();
  final BasicInfoPageConfig screenConfig;
  InfoNavigationFlow? flow;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return BaseSettingsPage(
        title: "Bank information",
        buttonText: screenConfig.ctaText,
        saveSwitch: screenConfig.showSaveSwitch
            ? SaveSwitch(
                value: _viewModel.switchValue,
                onChanged: _viewModel.setSwitchValue,
              )
            : null,
        onButtonPressed: () async {
          await _onNextClicked();
        },
        form: Form(
          key: _viewModel.formKey,
          child: Column(
            children: [
              InputField(
                label: "Beneficiary name",
                textInputAction: TextInputAction.next,
                controller: _viewModel.beneficiaryNameController,
                validator: requiredFieldValidator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: marginBetweenFields),
              InputField(
                label: "Account number (IBAN)",
                textInputAction: TextInputAction.next,
                controller: _viewModel.ibanController,
                validator: requiredFieldValidator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: marginBetweenFields),
              InputField(
                label: "Swift code",
                textInputAction: TextInputAction.next,
                controller: _viewModel.swiftController,
                validator: requiredFieldValidator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: marginBetweenFields),
              InputField(
                label: "Bank Name",
                textInputAction: TextInputAction.next,
                controller: _viewModel.bankNameController,
                validator: requiredFieldValidator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: marginBetweenFields),
              InputField(
                label: "Bank address",
                textInputAction: TextInputAction.next,
                controller: _viewModel.bankAddressController,
                maxLines: null,
                minLines: null,
                validator: requiredFieldValidator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: bigBetweenFields),
              SwitchRow(
                text: "Intermediary bank (optional)",
                value: _viewModel.isIntermediaryBankEnabled,
                onChanged: (value) {
                  _viewModel.setIntermediaryBankEnabled(value);
                },
              ),
              Visibility(
                visible: _viewModel.isIntermediaryBankEnabled,
                child: Column(
                  children: [
                    const SizedBox(height: marginBetweenFields),
                    InputField(
                      label: "Account number (IBAN)",
                      textInputAction: TextInputAction.next,
                      controller: _viewModel.intIbanController,
                      validator: _validateIntBank,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(height: marginBetweenFields),
                    InputField(
                      label: "Swift code",
                      textInputAction: TextInputAction.next,
                      controller: _viewModel.intSwiftController,
                      validator: _validateIntBank,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(height: marginBetweenFields),
                    InputField(
                      label: "Bank Name",
                      textInputAction: TextInputAction.next,
                      controller: _viewModel.intBankNameController,
                      validator: _validateIntBank,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(height: marginBetweenFields),
                    InputField(
                      label: "Bank address",
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
    });
  }

  String? _validateIntBank(String? value) {
    if (!_viewModel.isIntermediaryBankEnabled) return null;
    if (value == null || value.isEmpty) {
      return "Required filed";
    }
    return null;
  }

  Future _onNextClicked() async {
    if (_viewModel.formKey.currentState!.validate()) {
      final bankInfo = _viewModel.bankInfo;
      if (_viewModel.switchValue || screenConfig.alwaysSave) {
        await _viewModel.saveBankInfo(bankInfo);
      }

      if (flow != null) {
        if (flow is AddInvoiceNavigationFlow) {
          (flow as AddInvoiceNavigationFlow).invoiceFlowData.bankInfo =
              bankInfo;
        }

        flow!.onNextPress();
      }
    }
  }
}
