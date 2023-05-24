import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/src/core/di/di.dart';
import 'package:invoice_app/src/core/presenter/routes/app_route.gr.dart';

import 'onboarding_viewmodel.dart';

@RoutePage()
class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({Key? key}) : super(key: key);

  final OnboardingViewModel _viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    final navigator = context.router;
    return Align(
      alignment: Alignment.center,
      child: ElevatedButton(
        child: const Text('Finish onboarding'),
        onPressed: () async {
          await _viewModel.finishOnboarding();
          navigator.replace(InvoiceListRoute());
        },
      ),
    );
  }
}
