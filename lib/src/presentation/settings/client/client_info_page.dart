import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:invoice_app/src/core/di/di.dart';
import 'package:invoice_app/src/core/presenter/routes/app_route.gr.dart';
import 'package:invoice_app/src/core/settings/const.dart';
import 'package:invoice_app/src/core/presenter/components/field_validators.dart';

import '../base_settings_page.dart';
import 'client_info_viewmodel.dart';

@RoutePage()
class ClientInfoPage extends StatelessWidget {
  ClientInfoPage({Key? key}) : super(key: key);

  final ClientInfoViewModel _viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    final navigator = context.router;

    return Observer(
      builder: (context) {
        return BaseSettingsPage(
          title: "Client information",
          buttonText: 'Next step',
          key: _viewModel.formKey,
          onButtonPressed: () async {
            await _onNextStepClick(context);
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
          ),
        );
      },
    );
  }

  Future _onNextStepClick(BuildContext context) async {
    final navigator = context.router;

    if (_viewModel.formKey.currentState!.validate()) {
      var client = _viewModel.clientInfo;
      if (_viewModel.saveSwitch) {
        await _viewModel.saveInfo(client);
      }

      navigator.push(BasicInfoRoute(clientInfo: client));
    }
  }
}
