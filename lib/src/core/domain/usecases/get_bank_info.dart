import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/data/repositories/bank_repository.dart';
import 'package:invoice_app/src/core/domain/data_models/bank_info.dart';

abstract class IGetBankInfo {
  BankInfo? get();
}

@Injectable(as: IGetBankInfo)
class GetBankInfo implements IGetBankInfo {
  final IBankRepository _repository;

  GetBankInfo(this._repository);

  @override
  BankInfo? get() => _repository.getBankInfo();
}
