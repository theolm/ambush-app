import 'package:injectable/injectable.dart';

import '../datasources/local_datasource.dart';

abstract class ICompanyRepository {
  String? getCompanyName();
  void saveCompanyName(String value);
}

@Injectable(as: ICompanyRepository)
class CompanyRepository implements ICompanyRepository {
  final ILocalDataSource _source;

  CompanyRepository(this._source);

  @override
  String? getCompanyName() => _source.getCompanyName();

  @override
  void saveCompanyName(String value) {
    _source.saveCompanyName(value);
  }
}