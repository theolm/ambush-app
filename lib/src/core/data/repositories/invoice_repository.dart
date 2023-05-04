import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/data/models/hive_bank_info.dart';
import 'package:invoice_app/src/core/data/models/hive_invoice.dart';
import 'package:invoice_app/src/features/settings/domain/models/bank_info.dart';

import '../datasources/local_datasource.dart';

abstract class IInvoiceRepository {
  List<HiveInvoice> getInvoiceList();

  Future<void> saveInvoice(HiveInvoice value);
}

@Singleton(as: IInvoiceRepository)
class InvoiceRepository implements IInvoiceRepository {
  final ILocalDataSource _source;

  InvoiceRepository(this._source);

  @override
  List<HiveInvoice> getInvoiceList() => _source.getInvoiceList();

  @override
  Future<void> saveInvoice(HiveInvoice value) => _source.saveInvoice(value);
}
