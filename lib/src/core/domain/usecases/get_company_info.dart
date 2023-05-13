import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/data/repositories/company_repository.dart';
import 'package:invoice_app/src/core/domain/data_models/comp_info.dart';

abstract class IGetCompanyInfo {
  CompanyInfo? get();
}

@Injectable(as: IGetCompanyInfo)
class GetCompanyInfo implements IGetCompanyInfo {
  final ICompanyRepository _repository;

  GetCompanyInfo(this._repository);

  @override
  CompanyInfo? get() => _repository.getCompanyInfo();
}
