import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/src/features/settings/presentation/SettingsItem.dart';
import 'package:invoice_app/src/features/settings/presentation/settings_viewmodel.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/di/di.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);

  final SettingsViewModel _viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: Observer(
        builder: (_) {
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            children: [
              SettingsItem(
                title: 'Company name',
                subtitle: _viewModel.companyName,
                onClick: () {
                  _viewModel.updateCompanyName("Ambush");
                },
              ),
              const Divider(),
              SettingsItem(
                title: 'Company address',
                subtitle: _viewModel.companyAddress,
                onClick: () {
                  _viewModel.updateCompanyAddress("testando a parada pra salvar endereco");
                },
              ),
              const Divider(),
              SettingsItem(
                title: 'Bank information',
                subtitle: _viewModel.bankInformation,
                onClick: () {},
              ),
              const Divider(),
            ],
          );
        }
      ),
    );
  }
}
