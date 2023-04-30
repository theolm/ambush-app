import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/src/core/di/di.dart';
import 'package:invoice_app/src/core/domain/const.dart';

import '../save_fab.dart';
import 'service_info_viewmodel.dart';

@RoutePage()
class ServiceInfoPage extends StatelessWidget {
  ServiceInfoPage({Key? key}) : super(key: key);

  final ServiceInfoViewModel _viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Service information")),
      floatingActionButton: SaveFab(
        onClick: () async {},
      ),
      body: ListView(
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
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: regularBetweenFields),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Quantity",
              hintText: "e.g. 1.00",
            ),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: regularBetweenFields),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Currency",
              hintText: "e.g. USD",
            ),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: regularBetweenFields),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Unit price",
              hintText: "e.g. 5000.00",
            ),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: regularBetweenFields),
        ],
      ),
    );
  }
}
