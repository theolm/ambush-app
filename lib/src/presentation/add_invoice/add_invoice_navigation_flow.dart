import 'package:auto_route/auto_route.dart';
import 'package:ambush_app/src/core/routes/app_route.gr.dart';
import 'package:ambush_app/src/domain/models/invoice_flow_data.dart';
import 'package:ambush_app/src/presentation/settings/base_settings_page.dart';
import 'package:ambush_app/src/presentation/settings/info_navigation_flow.dart';

class AddInvoiceNavigationFlow implements InfoNavigationFlow {
  final StackRouter _router;
  final InvoiceFlowData invoiceFlowData;

  final _pageConfig = BasicInfoPageConfig(
    ctaText: 'Next step',
    showSaveSwitch: true,
    alwaysSave: false,
  );

  AddInvoiceNavigationFlow(
    this._router,
    this.invoiceFlowData,
  );

  @override
  void onBackPress() {
    _router.pop();
  }

  @override
  void onFinishFlow() {
    _router.popUntilRoot();
  }

  @override
  void onNextPress() {
    final currentRoute = _router.current.name;
    switch (currentRoute) {
      case ClientInfoRoute.name:
        _router.push(
          BasicInfoRoute(
            flow: this,
            screenConfig: _pageConfig,
          ),
        );
        break;
      case BasicInfoRoute.name:
        _router.push(
          BankInfoRoute(
            flow: this,
            screenConfig: _pageConfig,
          ),
        );
        break;
      case BankInfoRoute.name:
        _router.push(
          ServiceInfoRoute(
            flow: this,
            screenConfig: _pageConfig,
          ),
        );
        break;
      case ServiceInfoRoute.name:
        _router.push(
          AddInvoiceRoute(flow: this),
        );
        break;
    }
  }

  @override
  void start() {
    _router.push(
      ClientInfoRoute(
        flow: this,
        screenConfig: _pageConfig,
      ),
    );
  }
}
