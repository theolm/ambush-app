import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/src/features/generate_pdf/domain/models/bank_info.dart';
import 'package:invoice_app/src/features/settings/presentation/SettingsItem.dart';
import 'package:invoice_app/src/features/settings/presentation/dialogs/bank_info_bs.dart';
import 'package:invoice_app/src/features/settings/presentation/dialogs/company_address_bs.dart';
import 'package:invoice_app/src/features/settings/presentation/settings_viewmodel.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/di/di.dart';
import 'dialogs/company_name_bs.dart';

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
                onClick: () async {
                  var text = await showCompanyNameBS<String>(context, _viewModel.companyName);
                  if(text != null) {
                    _viewModel.updateCompanyName(text);
                  }
                },
              ),
              const Divider(),
              SettingsItem(
                title: 'Company address',
                subtitle: _viewModel.companyAddress,
                onClick: () async {
                  var text = await showCompanyAddressBS<String>(context, _viewModel.companyAddress);
                  if(text != null) {
                    _viewModel.updateCompanyAddress(text);
                  }
                },
              ),
              const Divider(),
              SettingsItem(
                title: 'Bank information',
                subtitle: _viewModel.bankInformation,
                onClick: () async {
                  var bankInfo = await showBankInfoBS<BankInfo?>(context, null);
                  if(bankInfo != null) {
                    _viewModel.updateBankInfo(bankInfo);
                  }

                },
              ),
              const Divider(),
            ],
          );
        }
      ),
    );
  }
}
