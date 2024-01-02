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
            onPressed: () async {
              await _viewModel.createBackup();
            },
          ),
          const SizedBox(height: 36),
          ElevatedButton(
            child: const Text('Import Backup'),
            onPressed: () async {
              var result = await showDialog<bool>(
                context: context,
                builder: (BuildContext context) => dialog(context),
              );

              if (result == true) await _viewModel.restoreBackup();
            },
          ),
        ],
      ),
    );
  }

  AlertDialog dialog(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AlertDialog(
      title: const Text('Are you sure you want to restore this backup?'),
      content: const Text(
          'All current invoices will be deleted and replaced by the backup. This action cannot be undone.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: Text(
            "Restore",
            style: TextStyle(color: colorScheme.primary),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text(
            "Cancel",
            style: TextStyle(color: colorScheme.secondary),
          ),
        ),
      ],
    );
  }
}
