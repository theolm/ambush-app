import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:invoice_app/src/core/di/di.dart';
import 'package:invoice_app/src/core/settings/const.dart';
import 'package:invoice_app/src/core/presenter/components/field_validators.dart';
import 'package:invoice_app/src/presentation/add_invoice/add_invoice_navigation_flow.dart';
import 'package:invoice_app/src/presentation/settings/info_navigation_flow.dart';
import 'package:invoice_app/src/presentation/utils/flow_utils.dart';

import '../base_settings_page.dart';
import 'client_info_viewmodel.dart';

@RoutePage()
class ClientInfoPage extends StatelessWidget {
  ClientInfoPage({Key? key, required this.flow, required this.screenConfig}) : super(key: key);

  final ClientInfoViewModel _viewModel = getIt();
  final _formKey = GlobalKey<FormState>();
  final BasicInfoPageConfig screenConfig;
  InfoNavigationFlow? flow;

  @override
  Widget build(BuildContext context) {
    final isSettings = isSettingsFlow(flow);
    return Observer(
      builder: (context) {
        return BaseSettingsPage(
          title: "Client information",
          key: _formKey,
          onButtonPressed: () async {
            await _onNextStepClick();
          },
          buttonText: screenConfig.ctaText,
          saveSwitch: screenConfig.showSaveSwitch
              ? SaveSwitch(
                  value: _viewModel.saveSwitch,
                  onChanged: _viewModel.onSwitchClicked,
                )
              : null,
          form: Form(
            key: _formKey,
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

  Future _onNextStepClick() async {
    if (_formKey.currentState!.validate()) {
      var client = _viewModel.clientInfo;
      if (_viewModel.saveSwitch || screenConfig.alwaysSave) {
        await _viewModel.saveInfo(client);
      }

      if (flow != null) {
        if (flow is AddInvoiceNavigationFlow) {
          (flow as AddInvoiceNavigationFlow).invoiceFlowData.clientInfo =
              client;
        }

        flow!.onNextPress();
      }
    }
  }
}
