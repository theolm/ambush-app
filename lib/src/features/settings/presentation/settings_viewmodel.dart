import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/domain/usecases/get_bank_info.dart';
import 'package:invoice_app/src/core/domain/usecases/get_company_address.dart';
import 'package:invoice_app/src/core/domain/usecases/get_company_name.dart';
import 'package:invoice_app/src/core/domain/usecases/save_bank_info.dart';
import 'package:invoice_app/src/core/domain/usecases/save_company_address.dart';
import 'package:invoice_app/src/core/domain/usecases/save_company_name.dart';
import 'package:invoice_app/src/features/generate_pdf/domain/models/bank_info.dart';
import 'package:mobx/mobx.dart';

part 'settings_viewmodel.g.dart';

@injectable
class SettingsViewModel extends _SettingsViewModelBase
    with _$SettingsViewModel {
  SettingsViewModel(
    super._getCompanyName,
    super._getCompanyAddress,
    super._getBankInfo,
    super._saveCompanyName,
    super._saveCompanyAddress,
    super._saveBankInfo,
  );
}

abstract class _SettingsViewModelBase with Store {
  final IGetCompanyName _getCompanyName;
  final IGetCompanyAddress _getCompanyAddress;
  final IGetBankInfo _getBankInfo;
  final ISaveCompanyName _saveCompanyName;
  final ISaveCompanyAddress _saveCompanyAddress;
  final ISaveBankInfo _saveBankInfo;

  _SettingsViewModelBase(
    this._getCompanyName,
    this._getCompanyAddress,
    this._getBankInfo,
    this._saveCompanyName,
    this._saveCompanyAddress,
    this._saveBankInfo,
  ) {
    companyName = _getCompanyName.get();
    companyAddress = _getCompanyAddress.get();
    bankInformation = _getBankInfo.get().toString();
  }

  @observable
  String? companyName;

  @observable
  String? companyAddress;

  @observable
  String? bankInformation;

  @action
  Future updateCompanyName(String value) async {
    await _saveCompanyName.save(value);
    companyName = _getCompanyName.get();
  }

  @action
  Future updateCompanyAddress(String value) async {
    await _saveCompanyAddress.save(value);
    companyAddress = _getCompanyAddress.get();
  }

  @action
  Future updateBankInfo(BankInfo info) async {
    await _saveBankInfo.save(info);
    bankInformation = _getBankInfo.get().toString();
  }
}
