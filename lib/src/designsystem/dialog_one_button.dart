import 'package:flutter/material.dart';

class DialogOneButton extends StatelessWidget {
  const DialogOneButton(
      {super.key,
      required this.title,
      required this.supportText,
      required this.button});

  final String title;
  final String supportText;
  final DialogButton button;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: textTheme.headlineSmall,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              supportText,
              style: textTheme.bodyMedium,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              TextButton(
                onPressed: button.onClick,
                child: Text(
                  button.text,
                  style: textTheme.labelLarge,
                ),
              )
            ])
          ],
        ),
      ),
    );
  }
}

class DialogButton {
  final String text;
  final VoidCallback onClick;

  DialogButton(this.text, this.onClick);
}
