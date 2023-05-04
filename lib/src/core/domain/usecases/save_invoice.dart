import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/data/models/hive_invoice.dart';
import 'package:invoice_app/src/core/data/repositories/invoice_repository.dart';

abstract class ISaveInvoice {
  Future<void> save(HiveInvoice value);
}

@Injectable(as: ISaveInvoice)
class SaveInvoice implements ISaveInvoice {
  final IInvoiceRepository _repository;

  SaveInvoice(this._repository);

  @override
  Future<void> save(HiveInvoice value) =>
      _repository.saveInvoice(value);

}
