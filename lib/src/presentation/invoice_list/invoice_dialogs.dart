import 'package:flutter/material.dart';
import 'package:ambush_app/src/domain/models/invoice.dart';

class InvoiceOptions extends StatelessWidget {
  const InvoiceOptions({super.key, required this.invoice});

  final Invoice invoice;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AlertDialog(
      title: Text('Invoice #${invoice.id}'),
      content: const Text('What do you want to do with this invoice?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(InvoiceActions.delete);
          },
          child: Text(
            "Delete",
            style: TextStyle(color: colorScheme.error),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(InvoiceActions.share);
          },
          child: const Text("Share"),
        ),
      ],
    );
  }
}

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AlertDialog(
      title: const Text('Are you sure you want to delete this invoice?'),
      content: const Text('This action cannot be undone.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: Text(
            "Delete",
            style: TextStyle(color: colorScheme.error),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text("Cancel"),
        ),
      ],
    );
  }
}

enum InvoiceActions { share, delete }
