import 'package:injectable/injectable.dart';
import 'package:hive_flutter/hive_flutter.dart';

const _keyCompanyName = 'companyName';

abstract class ILocalDataSource {
  Future initLocalDataSource();

  String? getCompanyName();

  Future saveCompanyName(String value);
}

@Singleton(as: ILocalDataSource)
class LocalDataSource implements ILocalDataSource {
  static const _appBoxName = 'AppBox';
  late Box _appBox;

  @override
  Future initLocalDataSource() async {
    await Hive.initFlutter();
    _appBox = await _getAppBox();
    print(_appBox);
  }

  @override
  String? getCompanyName() => _appBox.get(_keyCompanyName);

  @override
  Future saveCompanyName(String value) async {
    await _appBox.put(_keyCompanyName, value);
  }

  Future<Box> _getAppBox() async => await Hive.openBox(_appBoxName);
}
