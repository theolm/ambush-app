import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.onClick})
      : super(key: key);

  final String title;
  final String? subtitle;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).colorScheme;
    final subtitleValue = (subtitle != null && subtitle!.isNotEmpty)
        ? subtitle!
        : 'No info yet. Click here to add it.';

    return InkWell(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: textTheme.titleLarge),
                  const SizedBox(height: 2),
                  Text(
                    subtitleValue,
                    style: textTheme.titleSmall?.apply(
                      color: colorTheme.onBackground.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: onClick,
              icon: const Icon(Icons.edit_note_rounded),
            )
          ],
        ),
      ),
    );
  }
}
