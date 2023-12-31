import 'package:injectable/injectable.dart';
import 'package:ambush_app/src/data/repositories/invoice_repository.dart';
import 'package:ambush_app/src/domain/models/invoice.dart';

abstract class IGetInvoiceList {
  List<Invoice> get();

  Stream<List<Invoice>> observe();
}

@Injectable(as: IGetInvoiceList)
class GetInvoiceList implements IGetInvoiceList {
  final IInvoiceRepository _repository;

  GetInvoiceList(this._repository);

  @override
  List<Invoice> get() => _repository.getInvoiceList();

  @override
  Stream<List<Invoice>> observe() => _repository.observe();
}
