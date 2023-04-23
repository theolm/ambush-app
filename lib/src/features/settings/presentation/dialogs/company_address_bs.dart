import 'package:flutter/material.dart';
import 'package:invoice_app/src/core/presenter/base_bottom_sheet_content.dart';

Future<T?> showCompanyAddressBS<T>(BuildContext context, String? initialValue) =>
    showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        final controller = TextEditingController(text: initialValue ?? "");
        controller.selection =
            TextSelection.collapsed(offset: controller.text.length);
        final textTheme = Theme.of(context).textTheme;
        return BaseBottomSheetContent(
          child: Column(
            children: [
              Text(
                "Company address",
                style: textTheme.headlineSmall,
              ),
              const SizedBox(height: 24),
              TextField(
                controller: controller,
                autofocus: true,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 32),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(controller.text);
                  },
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
        );
      },
    );
