import 'package:injectable/injectable.dart';

import '../datasources/local_datasource.dart';

abstract class ICompanyRepository {
  String? getCompanyName();
  String? getCompanyAddress();
  Future<void> saveCompanyName(String value);
  Future<void> saveCompanyAddress(String value);
}

@Singleton(as: ICompanyRepository)
class CompanyRepository implements ICompanyRepository {
  final ILocalDataSource _source;

  CompanyRepository(this._source);

  @override
  String? getCompanyName() => _source.getCompanyInfo().name;

  @override
  String? getCompanyAddress() => _source.getCompanyInfo().address;

  @override
  Future<void> saveCompanyName(String value) {
    var comp = _source.getCompanyInfo();
    comp.name = value;

    return _source.saveCompanyInfo(comp);
  }

  @override
  Future<void> saveCompanyAddress(String value) {
    var comp = _source.getCompanyInfo();
    comp.address = value;

    return _source.saveCompanyInfo(comp);
  }
}