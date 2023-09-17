import 'package:injectable/injectable.dart';
import 'package:ambush_app/src/data/repositories/company_repository.dart';
import 'package:ambush_app/src/domain/models/comp_info.dart';

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
