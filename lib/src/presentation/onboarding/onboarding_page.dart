import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/src/core/di/di.dart';
import 'package:invoice_app/src/core/presenter/routes/app_route.gr.dart';
import 'package:invoice_app/src/core/settings/const.dart';
import 'package:invoice_app/src/presentation/onboarding/onboarding_navigation_flow.dart';

import 'onboarding_viewmodel.dart';

@RoutePage()
class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({Key? key}) : super(key: key);

  final OnboardingViewModel _viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    final navigator = context.router;
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(regularMargin),
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
                onPressed: () async {
                  await _viewModel.finishOnboarding();
                  final flow = OnBoardingNavigationFlow(navigator);
                  flow.start();
                },
                child: const Text('Set my info'),
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () async {
                  await _viewModel.finishOnboarding();
                  navigator.replace(InvoiceListRoute());
                },
                child: const Text("I'll do it later"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
