import 'package:flutter/material.dart';
import 'package:invoice_app/src/core/settings/const.dart';

class BaseSettingsPage extends StatelessWidget {
  const BaseSettingsPage({
    super.key,
    required this.title,
    this.infoText,
    required this.buttonText,
    required this.onButtonPressed,
    required this.form,
    this.saveSwitch,
  });

  final String title;
  final String? infoText;
  final Form form;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final SaveSwitch? saveSwitch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: regularMargin,
          horizontal: regularMargin,
        ),
        children: [
          if (infoText != null) Text(infoText!),
          form,
          if (saveSwitch != null)
            _saveInfoRow(context, saveSwitch!.value),
          const SizedBox(height: 36),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton(
                onPressed: onButtonPressed,
                child: Text(buttonText),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _saveInfoRow(BuildContext context, bool switchValue) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        const SizedBox(height: regularMargin),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Save the information for the next invoices",
              style: textTheme.bodyMedium,
            ),
            Switch(
              value: switchValue,
              onChanged: saveSwitch!.onChanged,
            ),
          ],
        ),
      ],
    );
  }
}

class SaveSwitch {
  final bool value;
  final Function(bool) onChanged;

  SaveSwitch({required this.value, required this.onChanged});
}
