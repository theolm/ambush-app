import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/domain/usecases/get_company_name.dart';
import 'package:invoice_app/src/core/domain/usecases/save_company_name.dart';
import 'package:mobx/mobx.dart';

part 'settings_viewmodel.g.dart';

@injectable
class SettingsViewModel extends _SettingsViewModelBase
    with _$SettingsViewModel {
  SettingsViewModel(super.saveCompanyName, super.getCompanyName);
}

abstract class _SettingsViewModelBase with Store {
  final ISaveCompanyName _saveCompanyName;
  final IGetCompanyName _getCompanyName;

  _SettingsViewModelBase(this._saveCompanyName, this._getCompanyName) {
    companyName = _getCompanyName.get();
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
  void updateCompanyAddress(String value) {
    companyAddress = value;
  }
}
