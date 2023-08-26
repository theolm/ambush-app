import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/src/core/presenter/routes/app_route.gr.dart';

@RoutePage()
class InfoAlertPage extends StatelessWidget {
  const InfoAlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: Stack(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: () {
                  context.router.pop();
                },
                icon: const Icon(Icons.close_rounded),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Do you want to set your information now?',
                  style: textTheme.headlineSmall?.copyWith(
                      color: colors.tertiary, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'It may speed up your invoice generation.',
                  style: textTheme.bodyMedium?.copyWith(color: colors.tertiary),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 36),
                FilledButton(
                  onPressed: () {
                    context.router.replace(const SettingsRoute());
                  },
                  child: const Text('Set my info'),
                ),
                const SizedBox(height: 20),
                OutlinedButton(
                  onPressed: () {
                    context.router.pop();
                  },
                  child: const Text("I'll do it later"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
