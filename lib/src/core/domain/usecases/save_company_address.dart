import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/data/repositories/company_repository.dart';

abstract class ISaveCompanyAddress {
  Future<void> save(String value);
}

@Injectable(as: ISaveCompanyAddress)
class SaveCompanyAddress implements ISaveCompanyAddress {
  final ICompanyRepository _repository;

  SaveCompanyAddress(this._repository);

  @override
  Future<void> save(String value) => _repository.saveCompanyAddress(value);
}
