import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:template_flutter/src/core/di/di.dart';
import 'package:template_flutter/src/features/demo_feature/presentation/demo_page.dart';

import 'src/app.dart';

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
