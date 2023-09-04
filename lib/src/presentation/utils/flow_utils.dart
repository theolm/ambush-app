import 'package:invoice_app/src/presentation/settings/info_navigation_flow.dart';
import 'package:invoice_app/src/presentation/settings/settings_navigation_flow.dart';

bool isSettingsFlow(InfoNavigationFlow? flow) => flow is SettingsNavigationFlow;
