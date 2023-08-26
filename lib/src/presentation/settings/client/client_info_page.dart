import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:invoice_app/src/core/di/di.dart';
import 'package:invoice_app/src/core/domain/const.dart';
import 'package:invoice_app/src/core/presenter/components/field_validators.dart';

import '../base_settings_page.dart';
import 'save_fab.dart';
import 'client_info_viewmodel.dart';

@RoutePage()
class ClientInfoPage extends StatelessWidget {
  ClientInfoPage({Key? key}) : super(key: key);

  final ClientInfoViewModel _viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    final navigator = context.router;

    return Observer(builder: (context) {
      return BaseSettingsPage(
          title: "Client information",
          buttonText: 'Save',
          key: _viewModel.formKey,
          onButtonPressed: () async {
            if (_viewModel.formKey.currentState!.validate()) {
              await _viewModel.saveInfo();
              navigator.pop();
            }
          },
          switchValue: _viewModel.saveSwitch,
          onSwitchClicked: _viewModel.onSwitchClicked,
          form: Form(
            key: _viewModel.formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: "Client name"),
                  textInputAction: TextInputAction.next,
                  validator: requiredFieldValidator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _viewModel.nameController,
                ),
                const SizedBox(height: marginBetweenFields),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: "Client address"),
                  textInputAction: TextInputAction.done,
                  maxLines: null,
                  minLines: null,
                  validator: requiredFieldValidator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _viewModel.addressController,
                ),
              ],
            ),
          ));
    });
  }
}
