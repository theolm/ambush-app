import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/data/models/hive_invoice.dart';
import 'package:invoice_app/src/core/data/repositories/bank_repository.dart';
import 'package:invoice_app/src/core/data/repositories/invoice_repository.dart';
import 'package:invoice_app/src/features/settings/domain/models/bank_info.dart';

abstract class IGetInvoiceList {
  List<HiveInvoice> get();
}

@Injectable(as: IGetInvoiceList)
class GetInvoiceList implements IGetInvoiceList {
  final IInvoiceRepository _repository;

  GetInvoiceList(this._repository);

  @override
  List<HiveInvoice> get() => _repository.getInvoiceList();
}
