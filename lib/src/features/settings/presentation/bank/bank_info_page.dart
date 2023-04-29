import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/src/core/di/di.dart';

import 'bank_info_viewmodel.dart';

@RoutePage()
class BankInfoPage extends StatelessWidget {
  BankInfoPage({Key? key}) : super(key: key);

  final BankInfoViewModel _viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bank information")),
    );
  }
}
