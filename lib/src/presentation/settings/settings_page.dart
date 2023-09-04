import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/src/core/settings/const.dart';
import 'package:invoice_app/src/core/presenter/routes/app_route.gr.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'settings_item.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: Observer(builder: (_) {
        return ListView(
          padding: const EdgeInsets.symmetric(vertical: regularMargin),
          children: [
            SettingsItem(
              title: "Basic information",
              subtitle: "Add basic information about your company",
              onClick: () {
                // context.router.push(BasicInfoRoute());
              },
            ),
            const Divider(indent: regularMargin, endIndent: regularMargin),
            SettingsItem(
              title: "Bank information",
              subtitle: "Add your bank account information",
              onClick: () {
                // context.router.push(BankInfoRoute());
              },
            ),
            const Divider(indent: regularMargin, endIndent: regularMargin),
            SettingsItem(
              title: "Service information",
              subtitle: "Add information about the services that you provided",
              onClick: () {
                // context.router.push(ServiceInfoRoute());
              },
            ),
            const Divider(indent: regularMargin, endIndent: regularMargin),
            SettingsItem(
              title: "Client information",
              subtitle: "Add information about your client",
              onClick: () {
                // context.router.push(ClientInfoRoute());
              },
            ),
          ],
        );
      }),
    );
  }
}
