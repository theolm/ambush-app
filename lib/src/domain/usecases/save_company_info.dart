import 'package:injectable/injectable.dart';
import 'package:ambush_app/src/data/repositories/company_repository.dart';
import 'package:ambush_app/src/domain/models/comp_info.dart';

abstract class ISaveCompanyInfo {
  Future<void> save(CompanyInfo value);
}

@Injectable(as: ISaveCompanyInfo)
class SaveCompanyInfo implements ISaveCompanyInfo {
  final ICompanyRepository _repository;

  SaveCompanyInfo(this._repository);

  @override
  Future<void> save(CompanyInfo value) => _repository.saveCompanyInfo(value);
}
