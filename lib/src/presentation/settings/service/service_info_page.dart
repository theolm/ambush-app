import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:invoice_app/src/core/di/di.dart';
import 'package:invoice_app/src/core/settings/const.dart';
import 'package:invoice_app/src/designsystem/currency_picker.dart';
import 'package:invoice_app/src/core/utils/field_validators.dart';
import 'package:invoice_app/src/designsystem/inputfield.dart';
import 'package:invoice_app/src/presentation/add_invoice/add_invoice_navigation_flow.dart';
import 'package:invoice_app/src/presentation/settings/info_navigation_flow.dart';
import '../base_settings_page.dart';
import 'service_info_viewmodel.dart';

@RoutePage()
class ServiceInfoPage extends StatelessWidget {
  ServiceInfoPage({
    Key? key,
    this.flow,
    required this.screenConfig,
  }) : super(key: key);

  final ServiceInfoViewModel _viewModel = getIt();
  final _formKey = GlobalKey<FormState>();
  final BasicInfoPageConfig screenConfig;
  InfoNavigationFlow? flow;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return BaseSettingsPage(
          title: "Service information",
          onButtonPressed: () async {
            await _onNextClick();
          },
          buttonText: screenConfig.ctaText,
          saveSwitch: screenConfig.showSaveSwitch
              ? SaveSwitch(
                  value: _viewModel.switchValue,
                  onChanged: _viewModel.onSwitchClicked,
                )
              : null,
          form: Form(
            key: _formKey,
            child: Column(
              children: [
                InputField(
                  label: "Description",
                  hintText: "e.g. Software Development",
                  controller: _viewModel.descriptionController,
                  validator: requiredFieldValidator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: marginBetweenFields),
                InputField(
                  label: "Quantity",
                  hintText: "e.g. 1.00",
                  controller: _viewModel.quantityController,
                  validator: doubleValueValidator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: marginBetweenFields),
                InputField(
                  label: "Currency",
                  controller: _viewModel.currencyController,
                  readOnly: true,
                  validator: requiredFieldValidator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.none,
                  onTap: () async {
                    var selected = await selectCurrency(
                      context,
                      await getCurrencyList(),
                      _viewModel.selectedCurrency?.cc,
                    );
                    if (selected != null) {
                      _viewModel.setSelectedCurrency(selected);
                    }
                  },
                ),
                const SizedBox(height: marginBetweenFields),
                InputField(
                  label: "Unit price",
                  hintText: "e.g. 5000.00",
                  controller: _viewModel.priceController,
                  validator: doubleValueValidator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: marginBetweenFields),
              ],
            ),
          ),
        );
      },
    );
  }

  Future _onNextClick() async {
    if (_formKey.currentState!.validate()) {
      final serviceInfo = _viewModel.getServiceInfo();
      if (serviceInfo == null) return;

      if (_viewModel.switchValue || screenConfig.alwaysSave) {
        await _viewModel.saveInfo(serviceInfo);
      }

      if (flow != null) {
        if (flow is AddInvoiceNavigationFlow) {
          (flow as AddInvoiceNavigationFlow).invoiceFlowData.service =
              serviceInfo;
        }

        flow!.onNextPress();
      }
    }
  }
}
