import 'package:flutter/material.dart';

class PrimarySwitch extends StatelessWidget {
  const PrimarySwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: onChanged,
    );
  }
}

class SwitchRow extends StatelessWidget {
  const SwitchRow({
    super.key,
    required this.text,
    required this.value,
    required this.onChanged,
  });

  final String text;
  final bool value;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: textTheme.bodyMedium,
        ),
        PrimarySwitch(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
