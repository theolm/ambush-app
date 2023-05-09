import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/data/models/hive_invoice.dart';

import '../datasources/local_datasource.dart';

abstract class IInvoiceRepository {
  List<HiveInvoice> getInvoiceList();

  Future<void> saveInvoice(HiveInvoice value);

  Stream<List<HiveInvoice>> observe();
}

@Singleton(as: IInvoiceRepository)
class InvoiceRepository implements IInvoiceRepository {
  final ILocalDataSource _source;

  InvoiceRepository(this._source);

  @override
  List<HiveInvoice> getInvoiceList() => _source.getInvoiceList().invoiceList;

  @override
  Future<void> saveInvoice(HiveInvoice value) => _source.saveInvoice(value);

  @override
  Stream<List<HiveInvoice>> observe() => _source.observeInvoiceList();
}
