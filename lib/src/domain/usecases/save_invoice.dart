import 'package:injectable/injectable.dart';
import 'package:ambush_app/src/data/repositories/invoice_repository.dart';
import 'package:ambush_app/src/domain/models/invoice.dart';

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
