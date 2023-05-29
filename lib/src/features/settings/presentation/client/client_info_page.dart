import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/src/core/di/di.dart';
import 'package:invoice_app/src/core/domain/const.dart';
import 'package:invoice_app/src/core/presenter/components/field_validators.dart';

import '../save_fab.dart';
import 'client_info_viewmodel.dart';

@RoutePage()
class ClientInfoPage extends StatelessWidget {
  ClientInfoPage({Key? key}) : super(key: key);

  final ClientInfoViewModel _viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    final navigator = context.router;
    return Scaffold(
      appBar: AppBar(title: const Text("Client information")),
      floatingActionButton: SaveFab(
        onClick: () async {
          if(_viewModel.formKey.currentState!.validate()) {
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
              decoration: const InputDecoration(labelText: "Client name"),
              textInputAction: TextInputAction.next,
              validator: requiredFieldValidator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _viewModel.nameController,
            ),
            const SizedBox(height: regularBetweenFields),
            TextFormField(
              decoration: const InputDecoration(labelText: "Client address"),
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
  }
}
