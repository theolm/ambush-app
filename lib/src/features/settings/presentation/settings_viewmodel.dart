import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/domain/usecases/get_company_address.dart';
import 'package:invoice_app/src/core/domain/usecases/get_company_name.dart';
import 'package:invoice_app/src/core/domain/usecases/save_company_address.dart';
import 'package:invoice_app/src/core/domain/usecases/save_company_name.dart';
import 'package:mobx/mobx.dart';

part 'settings_viewmodel.g.dart';

@injectable
class SettingsViewModel extends _SettingsViewModelBase
    with _$SettingsViewModel {
  SettingsViewModel(
      super._getCompanyName,
      super._getCompanyAddress,
      super._saveCompanyName,
      super._saveCompanyAddress,
  );
}

abstract class _SettingsViewModelBase with Store {
  final IGetCompanyName _getCompanyName;
  final IGetCompanyAddress _getCompanyAddress;
  final ISaveCompanyName _saveCompanyName;
  final ISaveCompanyAddress _saveCompanyAddress;

  _SettingsViewModelBase(
    this._getCompanyName,
    this._getCompanyAddress,
    this._saveCompanyName,
    this._saveCompanyAddress,
  ) {
    companyName = _getCompanyName.get();
    companyAddress = _getCompanyAddress.get();
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

}
