import 'package:injectable/injectable.dart';

import '../datasources/local_datasource.dart';

abstract class ICompanyRepository {
  String? getCompanyName();
  Future<void> saveCompanyName(String value);
}

@Singleton(as: ICompanyRepository)
class CompanyRepository implements ICompanyRepository {
  final ILocalDataSource _source;

  CompanyRepository(this._source);

  @override
  String? getCompanyName() => _source.getCompanyName();

  @override
  Future<void> saveCompanyName(String value) => _source.saveCompanyName(value);
}