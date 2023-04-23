import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/data/repositories/company_repository.dart';

abstract class IGetCompanyName {
  String? get();
}

@Injectable(as: IGetCompanyName)
class GetCompanyName implements IGetCompanyName {
  final ICompanyRepository _repository;

  GetCompanyName(this._repository);

  @override
  String? get() => _repository.getCompanyName();
}
