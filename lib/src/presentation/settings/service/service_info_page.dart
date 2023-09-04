import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:invoice_app/src/core/di/di.dart';
import 'package:invoice_app/src/core/settings/const.dart';
import 'package:invoice_app/src/core/presenter/components/currency_picker.dart';
import 'package:invoice_app/src/core/presenter/components/field_validators.dart';
import 'package:invoice_app/src/presentation/add_invoice/add_invoice_navigation_flow.dart';
import 'package:invoice_app/src/presentation/settings/info_navigation_flow.dart';
import '../base_settings_page.dart';
import 'service_info_viewmodel.dart';

@RoutePage()
class ServiceInfoPage extends StatelessWidget {
  ServiceInfoPage({
    Key? key,
    this.flow,
  }) : super(key: key);

  final ServiceInfoViewModel _viewModel = getIt();
  final _formKey = GlobalKey<FormState>();
  InfoNavigationFlow? flow;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return BaseSettingsPage(
          title: "Service information",
          buttonText: "Next step",
          onButtonPressed: () async {
            await _onNextClick();
          },
          switchValue: _viewModel.switchValue,
          onSwitchClicked: _viewModel.onSwitchClicked,
          form: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Description",
                    hintText: "e.g. Software Development",
                  ),
                  validator: requiredFieldValidator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  textInputAction: TextInputAction.next,
                  controller: _viewModel.descriptionController,
                ),
                const SizedBox(height: marginBetweenFields),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Quantity",
                    hintText: "e.g. 1.00",
                  ),
                  validator: doubleValueValidator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  controller: _viewModel.quantityController,
                ),
                const SizedBox(height: marginBetweenFields),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Currency",
                  ),
                  readOnly: true,
                  validator: requiredFieldValidator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.none,
                  controller: _viewModel.currencyController,
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
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Unit price",
                    hintText: "e.g. 5000.00",
                  ),
                  validator: doubleValueValidator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  controller: _viewModel.priceController,
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

      if (_viewModel.switchValue) {
        await _viewModel.saveInfo(serviceInfo);
      }

      if(flow != null) {
        if(flow is AddInvoiceNavigationFlow) {
          (flow as AddInvoiceNavigationFlow).invoiceFlowData.service = serviceInfo;
        }

        flow!.onNextPress();
      } else {
        //TODO
      }
    }
  }
}
