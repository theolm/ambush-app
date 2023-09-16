import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/data/repositories/invoice_repository.dart';
import 'package:invoice_app/src/domain/models/invoice.dart';

abstract class IDeleteInvoice {
  Future<void> delete(Invoice invoice);
}

@Injectable(as: IDeleteInvoice)
class DeleteInvoice implements IDeleteInvoice {
  IInvoiceRepository repository;

  DeleteInvoice(this.repository);

  @override
  Future<void> delete(Invoice invoice) => repository.deleteInvoice(invoice);
}
