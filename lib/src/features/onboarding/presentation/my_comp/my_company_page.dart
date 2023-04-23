import 'package:flutter/material.dart';
import 'package:invoice_app/src/core/di/di.dart';
import 'package:invoice_app/src/core/domain/const.dart';
import 'package:invoice_app/src/features/onboarding/presentation/my_comp/my_company_viewmodel.dart';

class MyCompanyPage extends StatelessWidget {
  MyCompanyPage({Key? key}) : super(key: key);

  final MyCompanyViewModel _viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Company info")),
      floatingActionButton: ElevatedButton(
        onPressed: _viewModel.onSavePress,
        child: const Text('Save'),
      ),
      body: Form(
        key: _viewModel.formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          children: [
            TextFormField(
              initialValue: _viewModel.companyName,
              decoration: const InputDecoration(labelText: "Company name"),
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                _viewModel.companyName = value;
                _viewModel.onChange(value);
              },
              validator: _mandatoryFieldValidator,
            ),
            Container(height: spaceBetweenFields),
            TextFormField(
              initialValue: _viewModel.companyAddress,
              decoration: const InputDecoration(labelText: "Company address"),
              maxLines: 10,
              minLines: 1,
              textInputAction: TextInputAction.done,
              validator: _mandatoryFieldValidator,
              onChanged: (value) {
                _viewModel.companyName = value;
                _viewModel.onChange(value);
              },
              onFieldSubmitted: (value) {
                _viewModel.onSavePress();
              },
            ),
          ],
        ),
      ),
    );
  }

  String? _mandatoryFieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is mandatory';
    }
    return null;
  }
}
