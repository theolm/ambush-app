import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/data/models/hive_invoice.dart';
import 'package:invoice_app/src/core/data/repositories/invoice_repository.dart';

abstract class IGetInvoiceList {
  List<HiveInvoice> get();

  Stream<List<HiveInvoice>> observe();
}

@Injectable(as: IGetInvoiceList)
class GetInvoiceList implements IGetInvoiceList {
  final IInvoiceRepository _repository;

  GetInvoiceList(this._repository);

  @override
  List<HiveInvoice> get() => _repository.getInvoiceList();

  @override
  Stream<List<HiveInvoice>> observe() => _repository.observe();
}
