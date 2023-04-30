import 'package:injectable/injectable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:invoice_app/src/core/data/models/hive_client_info.dart';
import 'package:invoice_app/src/core/data/models/hive_company_info.dart';
import 'package:invoice_app/src/core/data/models/hive_bank_info.dart';
import 'package:invoice_app/src/core/data/models/hive_service_info.dart';

const _appBoxName = 'AppBox';
const _keyCompanyInfo = 'companyInfo';
const _keyBankInfo = 'bankInfo';
const _keyServiceInfo = 'serviceInfo';
const _keyClientInfo = 'clientInfo';

abstract class ILocalDataSource {
  Future initLocalDataSource();

  HiveCompanyInfo getCompanyInfo();

  HiveBankInfo? getBankInfo();

  HiveServiceInfo? getServiceInfo();

  HiveClientInfo? getClientInfo();

  Future<void> saveClientInfo(HiveClientInfo value);

  Future<void> saveCompanyInfo(HiveCompanyInfo value);

  Future<void> saveBankInfo(HiveBankInfo value);

  Future<void> saveServiceInfo(HiveServiceInfo value);
}

@Singleton(as: ILocalDataSource)
class LocalDataSource implements ILocalDataSource {
  late Box _appBox;

  @override
  Future initLocalDataSource() async {
    await Hive.initFlutter();
    Hive.registerAdapter(HiveCompanyInfoAdapter());
    Hive.registerAdapter(HiveBankInfoAdapter());
    Hive.registerAdapter(HiveServiceInfoAdapter());
    _appBox = await _getAppBox();
  }

  //TODO: make nullable
  @override
  HiveCompanyInfo getCompanyInfo() =>
      _appBox.get(_keyCompanyInfo) ?? HiveCompanyInfo();

  @override
  HiveBankInfo? getBankInfo() => _appBox.get(_keyBankInfo);

  @override
  HiveServiceInfo? getServiceInfo() => _appBox.get(_keyServiceInfo);

  @override
  HiveClientInfo? getClientInfo() => _appBox.get(_keyClientInfo);

  @override
  Future<void> saveCompanyInfo(HiveCompanyInfo value) =>
      _appBox.put(_keyCompanyInfo, value);

  @override
  Future<void> saveBankInfo(HiveBankInfo value) =>
      _appBox.put(_keyBankInfo, value);

  @override
  Future<void> saveServiceInfo(HiveServiceInfo value) =>
      _appBox.put(_keyServiceInfo, value);

  @override
  Future<void> saveClientInfo(HiveClientInfo value) =>
      _appBox.put(_keyClientInfo, value);

  Future<Box> _getAppBox() async => await Hive.openBox(_appBoxName);
}
