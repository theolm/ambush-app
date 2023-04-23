import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'settings_viewmodel.g.dart';

@injectable
class SettingsViewModel extends _SettingsViewModelBase
    with _$SettingsViewModel {}

abstract class _SettingsViewModelBase with Store {
  _SettingsViewModelBase();

  @observable
  String? companyName;

  @observable
  String? companyAddress;

  @observable
  String? bankInformation;

  @action
  void updateCompanyName(String value) {
    companyName = value;
  }

  @action
  void updateCompanyAddress(String value) {
    companyAddress = value;
  }
}
