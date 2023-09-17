import 'package:auto_route/auto_route.dart';
import 'package:ambush_app/src/presentation/settings/info_navigation_flow.dart';

class SettingsNavigationFlow implements InfoNavigationFlow {
  final StackRouter _router;

  SettingsNavigationFlow(this._router);

  @override
  void onBackPress() {
    _router.pop();
  }

  @override
  void onFinishFlow() {
    _router.pop();
  }

  @override
  void onNextPress() {
    _router.pop();
  }

  @override
  void start() {}
}
