import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/data/models/hive_company_info.dart';
import 'package:invoice_app/src/core/domain/data_models/comp_info.dart';

import '../datasources/local_datasource.dart';

abstract class ICompanyRepository {
  CompanyInfo? getCompanyInfo();

  Future<void> saveCompanyInfo(CompanyInfo value);

  Stream<HiveCompanyInfo?> observeCompanyInfo();
}

@Singleton(as: ICompanyRepository)
class CompanyRepository implements ICompanyRepository {
  final ILocalDataSource _source;

  CompanyRepository(this._source);

  @override
  CompanyInfo? getCompanyInfo() => _source.getCompanyInfo()?.toDataModel();

  @override
  Future<void> saveCompanyInfo(CompanyInfo value) =>
      _source.saveCompanyInfo(HiveCompanyInfo.fromDataModel(value));

  @override
  Stream<HiveCompanyInfo?> observeCompanyInfo() => _source.observeCompanyInfo();
}
