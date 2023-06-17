import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Did you want to set your informations now?',
                style: textTheme.headlineSmall?.copyWith(
                    color: colors.tertiary, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'It may agilize your invoice generation.\nBut can set that again later.',
                style: textTheme.bodyMedium?.copyWith(color: colors.tertiary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 36),
              FilledButton(
                onPressed: () {},
                child: Text('Set my info'),
              ),
              const SizedBox(height: 20),
              OutlinedButton(onPressed: () {}, child: Text("I'll do it later")),
            ],
          ),
        ],
      ),
    );
  }
}
