import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ambush_app/src/core/di/di.dart';
import 'package:ambush_app/src/core/settings/const.dart';
import 'package:ambush_app/src/core/utils/field_validators.dart';
import 'package:ambush_app/src/designsystem/inputfield.dart';
import 'package:ambush_app/src/presentation/add_invoice/add_invoice_navigation_flow.dart';
import 'package:ambush_app/src/presentation/settings/info_navigation_flow.dart';

import '../base_settings_page.dart';
import 'basic_info_viewmodel.dart';

@RoutePage()
class BasicInfoPage extends StatelessWidget {
  BasicInfoPage({super.key, this.flow, required this.screenConfig});

  final BasicInfoViewModel _viewModel = getIt();
  final BasicInfoPageConfig screenConfig;
  final InfoNavigationFlow? flow;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return BaseSettingsPage(
        title: "Independent Contractor",
        infoText: "In this page you should insert your company information, not Ambush’s",
        buttonText: screenConfig.ctaText,
        saveSwitch: screenConfig.showSaveSwitch
            ? SaveSwitch(
                value: _viewModel.switchValue,
                onChanged: _viewModel.onSwitchClicked,
              )
            : null,
        onButtonPressed: () async {
          await onNextStepClick();
        },
        form: Form(
          key: _viewModel.formKey,
          child: Column(
            children: [
              InputField(
                label: "Company name",
                helperText: "Enter your company name",
                textInputAction: TextInputAction.next,
                controller: _viewModel.compNameController,
                validator: (String? value) {
                  var validation = requiredFieldValidator(value);
                  if(validation != null) {
                    return validation;
                  }

                  if(value!.toLowerCase().contains("ambush")) {
                    return "This should be your company name";
                  }

                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: marginBetweenFields),
              InputField(
                label: "Company address",
                helperText: "Enter your company address",
                textInputAction: TextInputAction.done,
                maxLines: null,
                minLines: null,
                validator: (String? value) {
                  var validation = requiredFieldValidator(value);
                  if(validation != null) {
                    return validation;
                  }

                  if(value!.toLowerCase().contains("20 harcourt") || value.toLowerCase().contains("d02 pf99")) {
                    return "This should be your company address";
                  }

                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _viewModel.compAddressController,
              ),
              const SizedBox(height: marginBetweenFields),
              InputField(
                label: "Company email",
                helperText: "Enter your company email",
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.emailAddress,
                validator: (String? value) {
                  var emailValidator = requiredEmailValidator(value);
                  if(emailValidator != null) {
                    return emailValidator;
                  }

                  if(value!.toLowerCase().contains("ap@ambush")) {
                    return "This should be your company email";
                  }

                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _viewModel.compEmailController,
              ),
            ],
          ),
        ),
      );
    });
  }

  Future onNextStepClick() async {
    if (_viewModel.formKey.currentState!.validate()) {
      final companyInfo = _viewModel.companyInfo;
      if (_viewModel.switchValue || screenConfig.alwaysSave) {
        await _viewModel.save(companyInfo);
      }

      if (flow != null) {
        if (flow is AddInvoiceNavigationFlow) {
          (flow as AddInvoiceNavigationFlow).invoiceFlowData.companyInfo =
              companyInfo;
        }

        flow!.onNextPress();
      }
    }
  }
}
