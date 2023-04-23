import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/data/repositories/company_repository.dart';

abstract class IGetCompanyAddress {
  String? get();
}

@Injectable(as: IGetCompanyAddress)
class GetCompanyAddress implements IGetCompanyAddress {
  final ICompanyRepository _repository;

  GetCompanyAddress(this._repository);

  @override
  String? get() => _repository.getCompanyAddress();
}
