import 'package:injectable/injectable.dart';
import 'package:ambush_app/src/data/repositories/bank_repository.dart';
import 'package:ambush_app/src/domain/models/bank_info.dart';

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
