import 'package:ambush_app/src/core/di/di.dart';
import 'package:ambush_app/src/core/settings/const.dart';
import 'package:ambush_app/src/presentation/settings/backup/backup_viewmodel.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BackupPage extends StatelessWidget {
  BackupPage({super.key});

  final BackupViewModel _viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Backup')),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: regularMargin,
          horizontal: regularMargin,
        ),
        children: [
          ElevatedButton(
            child: const Text('Create Backup'),
            onPressed: () {},
          ),
          const SizedBox(height: 36),
          ElevatedButton(
            child: const Text('Import Backup'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
