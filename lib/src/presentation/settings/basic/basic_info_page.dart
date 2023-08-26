import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:invoice_app/src/core/di/di.dart';
import 'package:invoice_app/src/core/settings/const.dart';
import 'package:invoice_app/src/core/presenter/components/field_validators.dart';

import '../base_settings_page.dart';
import 'basic_info_viewmodel.dart';

@RoutePage()
class BasicInfoPage extends StatelessWidget {
  BasicInfoPage({Key? key}) : super(key: key);

  final BasicInfoViewModel _viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    final navigator = context.router;

    return Observer(
      builder: (context) {
        return BaseSettingsPage(
          title: "Basic information",
          buttonText: "Save",
          switchValue: _viewModel.switchValue,
          onSwitchClicked: _viewModel.onSwitchClicked,
          onButtonPressed: () async {
            if (_viewModel.formKey.currentState!.validate()) {
              await _viewModel.save();
              navigator.pop();
            }
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
      }
    );
  }
}
