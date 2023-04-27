import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/data/models/hive_bank_info.dart';
import 'package:invoice_app/src/features/generate_pdf/domain/models/bank_info.dart';

import '../datasources/local_datasource.dart';

abstract class IBankRepository {
  BankInfo? getBankInfo();
  Future<void> saveBankInfo(BankInfo value);
}

@Singleton(as: IBankRepository)
class BankRepository implements IBankRepository {
  final ILocalDataSource _source;

  BankRepository(this._source);

  @override
  Future<void> saveBankInfo(BankInfo value) =>
      _source.saveBankInfo(HiveBankInfo.fromBankInfo(value));

  @override
  BankInfo? getBankInfo() {
    var hiveBankInfo = _source.getBankInfo();

    if(hiveBankInfo != null) {
      return hiveBankInfo.toBankInfo();
    } else {
      return null;
    }
  }
}
