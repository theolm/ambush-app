import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/data/repositories/company_repository.dart';

abstract class ISaveCompanyName {
  Future<void> save(String value);
}

@Injectable(as: ISaveCompanyName)
class SaveCompanyName implements ISaveCompanyName {
  final ICompanyRepository _repository;

  SaveCompanyName(this._repository);

  @override
  Future<void> save(String value) => _repository.saveCompanyName(value);
}
