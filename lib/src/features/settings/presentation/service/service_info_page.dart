import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/src/core/di/di.dart';
import 'package:invoice_app/src/core/domain/const.dart';
import 'package:invoice_app/src/core/presenter/components/currency_picker.dart';
import 'package:invoice_app/src/core/presenter/components/field_validators.dart';

import '../save_fab.dart';
import 'service_info_viewmodel.dart';

@RoutePage()
class ServiceInfoPage extends StatelessWidget {
  ServiceInfoPage({Key? key}) : super(key: key);

  final ServiceInfoViewModel _viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    final navigator = context.router;
    return Scaffold(
      appBar: AppBar(title: const Text("Service information")),
      floatingActionButton: SaveFab(
        onClick: () async {
          if (_viewModel.formKey.currentState!.validate()) {
            await _viewModel.saveInfo();
            navigator.pop();
          }
        },
      ),
      body: Form(
        key: _viewModel.formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(
            vertical: regularMargin,
            horizontal: regularMargin,
          ),
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
                  _viewModel.initialCurrency?.cc,
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
  }
}
