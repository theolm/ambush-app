import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/di/di.dart';

import 'src/app.dart';
import 'src/features/demo_feature/presentation/demo_page.dart';

Future<void> main() async {
  configureDependencies(Environment.prod);
  runApp(App());
}

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoPage();
  }
}
