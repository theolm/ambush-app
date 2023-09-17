import 'package:injectable/injectable.dart';
import 'package:ambush_app/src/data/repositories/invoice_repository.dart';
import 'dart:math';

abstract class IGetNextId {
  int? get();
}

@Injectable(as: IGetNextId)
class GetNextId implements IGetNextId {
  final IInvoiceRepository _repository;

  GetNextId(this._repository);

  @override
  int? get() {
    var invoiceList = _repository.getInvoiceList();

    if(invoiceList.isEmpty) {
      return null;
    } else {
      var lastMax = invoiceList.map((e) => e.id).reduce(max);
      return lastMax + 1;
    }
  }
}
