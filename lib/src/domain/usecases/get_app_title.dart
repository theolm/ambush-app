import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/data/repositories/company_repository.dart';

abstract class IGetAppTitle {
  String? get();

  Stream<String?> observe();
}

@Injectable(as: IGetAppTitle)
class GetAppTitle implements IGetAppTitle {
  final ICompanyRepository _repository;

  GetAppTitle(this._repository);

  @override
  String? get() => _repository.getCompanyInfo()?.name;

  @override
  Stream<String?> observe() =>
      _repository.observeCompanyInfo().map((event) => event?.name);
}
