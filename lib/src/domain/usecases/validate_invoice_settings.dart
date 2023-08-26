import 'package:injectable/injectable.dart';

import 'get_bank_info.dart';
import 'get_client_info.dart';
import 'get_company_info.dart';
import 'get_service_info.dart';

abstract class IValidateInvoiceSettings {
  InvoiceSettingsStatus validate();
}

@Injectable(as: IValidateInvoiceSettings)
class ValidateInvoiceSettings implements IValidateInvoiceSettings {
  ValidateInvoiceSettings(
    this._getBankInfo,
    this._getClientInfo,
    this._getCompanyInfo,
    this._getServiceInfo,
  );

  final IGetBankInfo _getBankInfo;
  final IGetClientInfo _getClientInfo;
  final IGetCompanyInfo _getCompanyInfo;
  final IGetServiceInfo _getServiceInfo;

  @override
  InvoiceSettingsStatus validate() {
    if(_getCompanyInfo.get() == null) {
      return InvoiceSettingsStatus.errorBasicInfo;
    }

    if(_getBankInfo.get() == null) {
      return InvoiceSettingsStatus.errorBankInfo;
    }

    if(_getServiceInfo.get() == null) {
      return InvoiceSettingsStatus.errorServiceInfo;
    }

    if(_getClientInfo.get() == null) {
      return InvoiceSettingsStatus.errorClientInfo;
    }

    return InvoiceSettingsStatus.ok;


  }
}

enum InvoiceSettingsStatus {
  ok,
  errorBasicInfo,
  errorBankInfo,
  errorServiceInfo,
  errorClientInfo,
}
