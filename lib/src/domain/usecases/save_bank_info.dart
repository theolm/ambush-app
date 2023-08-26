import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/data/repositories/bank_repository.dart';
import 'package:invoice_app/src/domain/models/bank_info.dart';

abstract class ISaveBankInfo {
  Future<void> save(BankInfo value);
}

@Injectable(as: ISaveBankInfo)
class SaveBankInfo implements ISaveBankInfo {
  final IBankRepository _repository;

  SaveBankInfo(this._repository);

  @override
  Future<void> save(BankInfo value) => _repository.saveBankInfo(value);
}
