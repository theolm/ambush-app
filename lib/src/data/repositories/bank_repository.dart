import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/data/models/hive_bank_info.dart';
import 'package:invoice_app/src/domain/models/bank_info.dart';

import '../datasource/local_datasource.dart';

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
      _source.saveBankInfo(HiveBankInfo.fromDataModel(value));

  @override
  BankInfo? getBankInfo() => _source.getBankInfo()?.toDataModel();

}
