import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/src/core/di/di.dart';
import 'package:invoice_app/src/core/domain/const.dart';
import 'package:invoice_app/src/core/presenter/components/field_validators.dart';
import 'package:invoice_app/src/features/settings/presentation/basic/basic_info_viewmodel.dart';
import 'package:invoice_app/src/features/settings/presentation/save_fab.dart';

@RoutePage()
class BasicInfoPage extends StatelessWidget {
  BasicInfoPage({Key? key}) : super(key: key);

  final BasicInfoViewModel _viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    final navigator = context.router;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic information"),
      ),
      floatingActionButton: SaveFab(
        onClick: () async {
          if(_viewModel.formKey.currentState!.validate()) {
            await _viewModel.save();
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
              decoration: const InputDecoration(labelText: "Company name"),
              textInputAction: TextInputAction.next,
              controller: _viewModel.compNameController,
              validator: requiredFieldValidator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            const SizedBox(height: regularBetweenFields),
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
}
