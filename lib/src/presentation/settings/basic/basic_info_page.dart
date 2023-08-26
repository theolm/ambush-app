import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:invoice_app/src/core/di/di.dart';
import 'package:invoice_app/src/core/presenter/routes/app_route.gr.dart';
import 'package:invoice_app/src/core/settings/const.dart';
import 'package:invoice_app/src/core/presenter/components/field_validators.dart';
import 'package:invoice_app/src/domain/models/client_info.dart';

import '../base_settings_page.dart';
import 'basic_info_viewmodel.dart';

@RoutePage()
class BasicInfoPage extends StatelessWidget {
  BasicInfoPage({Key? key, required this.clientInfo}) : super(key: key);

  final BasicInfoViewModel _viewModel = getIt();
  final ClientInfo clientInfo;

  @override
  Widget build(BuildContext context) {
    final navigator = context.router;

    return Observer(builder: (context) {
      return BaseSettingsPage(
        title: "Independent Contractor",
        buttonText: "Next step",
        switchValue: _viewModel.switchValue,
        onSwitchClicked: _viewModel.onSwitchClicked,
        onButtonPressed: () async {
          await onNextStepClick(navigator);
        },
        form: Form(
          key: _viewModel.formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Company name"),
                textInputAction: TextInputAction.next,
                controller: _viewModel.compNameController,
                validator: requiredFieldValidator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: marginBetweenFields),
              TextFormField(
                decoration: const InputDecoration(labelText: "Company address"),
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

  Future onNextStepClick(StackRouter navigator) async {
    if (_viewModel.formKey.currentState!.validate()) {
      final companyInfo = _viewModel.companyInfo;
      if (_viewModel.switchValue) {
        await _viewModel.save(companyInfo);
      }
      navigator.push(
        BankInfoRoute(
          clientInfo: clientInfo,
          companyInfo: companyInfo,
        ),
      );
    }
  }
}
