import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/data/repositories/invoice_repository.dart';
import 'package:invoice_app/src/core/domain/data_models/invoice.dart';

abstract class ISaveInvoice {
  Future<void> save(Invoice value);
}

@Injectable(as: ISaveInvoice)
class SaveInvoice implements ISaveInvoice {
  final IInvoiceRepository _repository;

  SaveInvoice(this._repository);

  @override
  Future<void> save(Invoice value) =>
      _repository.saveInvoice(value);

}
