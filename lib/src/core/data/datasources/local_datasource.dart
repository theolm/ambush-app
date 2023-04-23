import 'package:injectable/injectable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:invoice_app/src/core/data/models/company_info.dart';

const _appBoxName = 'AppBox';
const _keyCompanyInfo = 'companyInfo';

abstract class ILocalDataSource {
  Future initLocalDataSource();

  CompanyInfo getCompanyInfo();

  Future<void> saveCompanyInfo(CompanyInfo value);
}

@Singleton(as: ILocalDataSource)
class LocalDataSource implements ILocalDataSource {
  late Box _appBox;

  @override
  Future initLocalDataSource() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CompanyInfoAdapter());
    _appBox = await _getAppBox();
  }

  @override
  CompanyInfo getCompanyInfo() => _appBox.get(_keyCompanyInfo) ?? CompanyInfo();

  @override
  Future<void> saveCompanyInfo(CompanyInfo value) =>
      _appBox.put(_keyCompanyInfo, value);

  Future<Box> _getAppBox() async => await Hive.openBox(_appBoxName);
}
