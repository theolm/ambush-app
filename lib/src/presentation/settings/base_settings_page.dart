import 'package:flutter/material.dart';
import 'package:invoice_app/src/core/domain/const.dart';


class BaseSettingsPage extends StatelessWidget {
  const BaseSettingsPage({
    super.key,
    required this.title,
    this.infoText,
    required this.buttonText,
    required this.switchValue,
    required this.onSwitchClicked,
    required this.onButtonPressed,
    required this.form,
  });

  final String title;
  final String? infoText;
  final Form form;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final bool? switchValue;
  final Function(bool) onSwitchClicked;

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
          if (switchValue != null) _saveInfoRow(context, switchValue!),
          const SizedBox(height: 36),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton(
                  onPressed: onButtonPressed, child: Text(buttonText)),
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
              onChanged: onSwitchClicked,
            ),
          ],
        ),
      ],
    );
  }
}
