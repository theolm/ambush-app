import 'package:auto_route/auto_route.dart';
import 'package:invoice_app/src/core/presenter/routes/app_route.gr.dart';
import 'package:invoice_app/src/domain/models/invoice_flow_data.dart';
import 'package:invoice_app/src/presentation/settings/info_navigation_flow.dart';

class AddInvoiceNavigationFlow implements InfoNavigationFlow {
  final StackRouter _router;
  final InvoiceFlowData invoiceFlowData;

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
      case InvoiceListRoute.name:
        _router.push(ClientInfoRoute(flow: this));
        break;
      case ClientInfoRoute.name:
        _router.push(BasicInfoRoute(flow: this));
        break;
      case BasicInfoRoute.name:
        _router.push(BankInfoRoute(flow: this));
        break;
      case BankInfoRoute.name:
        _router.push(ServiceInfoRoute(flow: this));
        break;
      case ServiceInfoRoute.name:
        _router.push(AddInvoiceRoute(flow: this));
        break;
    }
  }
}
