import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/di/di.dart';

import 'src/app.dart';
import 'src/core/data/datasources/local_datasource.dart';
import 'src/features/invoice_list/presentation/list_page.dart';

Future<void> main() async {
  configureDependencies(Environment.prod);
  await getIt.get<ILocalDataSource>().initLocalDataSource();
  runApp(App());
}

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return InvoiceListPage();
  }
}
