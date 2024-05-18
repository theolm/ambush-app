import 'package:flutter/material.dart';

class SaveFab extends StatelessWidget {
  const SaveFab({
    super.key,
    required this.onClick,
  });
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    return FloatingActionButton.extended(
      backgroundColor: colorTheme.secondaryContainer,
      onPressed: onClick,
      label: const Text("Save"),
    );
  }
}
