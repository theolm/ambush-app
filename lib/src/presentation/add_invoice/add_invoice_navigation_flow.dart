import 'package:ambush_app/src/core/di/di.dart';
import 'package:ambush_app/src/domain/usecases/get_bank_info.dart';
import 'package:ambush_app/src/domain/usecases/get_client_info.dart';
import 'package:ambush_app/src/domain/usecases/get_company_info.dart';
import 'package:ambush_app/src/domain/usecases/get_service_info.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ambush_app/src/core/routes/app_route.gr.dart';
import 'package:ambush_app/src/domain/models/invoice_flow_data.dart';
import 'package:ambush_app/src/presentation/settings/base_settings_page.dart';
import 'package:ambush_app/src/presentation/settings/info_navigation_flow.dart';

class AddInvoiceNavigationFlow implements InfoNavigationFlow {
  final StackRouter _router;
  final InvoiceFlowData invoiceFlowData;
  final IGetClientInfo _getClientInfo = getIt();
  final IGetBankInfo _getBankInfo = getIt();
  final IGetCompanyInfo _getCompanyInfo = getIt();
  final IGetServiceInfo _getServiceInfo = getIt();

  final _pageConfig = BasicInfoPageConfig(
    ctaText: 'Next step',
    showSaveSwitch: true,
    alwaysSave: false,
  );

  AddInvoiceNavigationFlow(
    this._router,
    this.invoiceFlowData,
  ) {
    invoiceFlowData.clientInfo = _getClientInfo.get();
    invoiceFlowData.bankInfo = _getBankInfo.get();
    invoiceFlowData.companyInfo = _getCompanyInfo.get();
    invoiceFlowData.service = _getServiceInfo.get();
  }

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
    try {
      invoiceFlowData.validateData();
      _router.push(
        AddInvoiceRoute(flow: this),
      );
    } catch (e) {
      _router.push(
        BasicInfoRoute(
          flow: this,
          screenConfig: _pageConfig,
        ),
      );
    }
  }
}
