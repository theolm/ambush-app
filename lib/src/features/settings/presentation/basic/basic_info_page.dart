import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/src/core/di/di.dart';
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
          await _viewModel.save();
          navigator.pop();
        },
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: "Company name"),
            textInputAction: TextInputAction.next,
            controller: _viewModel.compNameController,
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(labelText: "Company address"),
            textInputAction: TextInputAction.done,
            maxLines: null,
            minLines: null,
            controller: _viewModel.compAddressController,
          ),
        ],
      ),
    );
  }
}
