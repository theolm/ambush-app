import 'dart:convert';

import 'package:ambush_app/src/data/repositories/invoice_repository.dart';
import 'package:ambush_app/src/domain/models/backup.dart';
import 'package:injectable/injectable.dart';

abstract class ICreateBackupFile {
  Future<Backup> create();
}

@Injectable(as: ICreateBackupFile)
class CreateBackupFile implements ICreateBackupFile {
  IInvoiceRepository repository;

  CreateBackupFile(this.repository);

  @override
  Future<Backup> create() async {
    final invoiceList = repository.getInvoiceList();
    return Backup(
      DateTime.now().millisecondsSinceEpoch.toString(),
      DateTime.now().millisecondsSinceEpoch,
      invoiceList,
    );
  }
}
