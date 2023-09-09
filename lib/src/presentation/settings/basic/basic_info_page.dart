import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:invoice_app/src/core/di/di.dart';
import 'package:invoice_app/src/core/presenter/routes/app_route.gr.dart';
import 'package:invoice_app/src/core/settings/const.dart';
import 'package:invoice_app/src/core/presenter/components/field_validators.dart';
import 'package:invoice_app/src/designsystem/inputfield.dart';
import 'package:invoice_app/src/presentation/add_invoice/add_invoice_navigation_flow.dart';
import 'package:invoice_app/src/presentation/settings/info_navigation_flow.dart';
import 'package:invoice_app/src/presentation/utils/flow_utils.dart';

import '../base_settings_page.dart';
import 'basic_info_viewmodel.dart';

@RoutePage()
class BasicInfoPage extends StatelessWidget {
  BasicInfoPage({Key? key, this.flow, required this.screenConfig})
      : super(key: key);

  final BasicInfoViewModel _viewModel = getIt();
  final BasicInfoPageConfig screenConfig;
  InfoNavigationFlow? flow;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return BaseSettingsPage(
        title: "Independent Contractor",
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
                textInputAction: TextInputAction.next,
                controller: _viewModel.compNameController,
                validator: requiredFieldValidator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: marginBetweenFields),
              InputField(
                label: "Company address",
                textInputAction: TextInputAction.done,
                maxLines: null,
                minLines: null,
                validator: requiredFieldValidator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _viewModel.compAddressController,
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
