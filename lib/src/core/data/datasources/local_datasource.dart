import 'package:injectable/injectable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:invoice_app/src/core/data/models/company_info.dart';
import 'package:invoice_app/src/core/data/models/hive_bank_info.dart';

const _appBoxName = 'AppBox';
const _keyCompanyInfo = 'companyInfo';
const _keyBankInfo = 'bankInfo';

abstract class ILocalDataSource {
  Future initLocalDataSource();

  CompanyInfo getCompanyInfo();

  HiveBankInfo? getBankInfo();

  Future<void> saveCompanyInfo(CompanyInfo value);

  Future<void> saveBankInfo(HiveBankInfo value);
}

@Singleton(as: ILocalDataSource)
class LocalDataSource implements ILocalDataSource {
  late Box _appBox;

  @override
  Future initLocalDataSource() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CompanyInfoAdapter());
    Hive.registerAdapter(HiveBankInfoAdapter());
    _appBox = await _getAppBox();
  }

  @override
  CompanyInfo getCompanyInfo() => _appBox.get(_keyCompanyInfo) ?? CompanyInfo();

  @override
  HiveBankInfo? getBankInfo() => _appBox.get(_keyBankInfo);

  @override
  Future<void> saveCompanyInfo(CompanyInfo value) =>
      _appBox.put(_keyCompanyInfo, value);

  @override
  Future<void> saveBankInfo(HiveBankInfo value) =>
      _appBox.put(_keyBankInfo, value);

  Future<Box> _getAppBox() async => await Hive.openBox(_appBoxName);
}
