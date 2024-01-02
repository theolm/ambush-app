import 'dart:convert';

import 'package:ambush_app/src/data/repositories/invoice_repository.dart';
import 'package:ambush_app/src/domain/models/backup.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

abstract class IRestoreBackupFile {
  Future<void> restore(Uint8List backup);
}

@Injectable(as: IRestoreBackupFile)
class RestoreBackupFile implements IRestoreBackupFile {
  final IInvoiceRepository repository;

  RestoreBackupFile(this.repository);

  @override
  Future<void> restore(Uint8List backup) async {
    try {
      final json = String.fromCharCodes(backup);
      final backupModel = Backup.fromJson(jsonDecode(json));
      if (backupModel.invoices.isNotEmpty) {
        await repository.deleteAllInvoices();
        await _saveInvoices(backupModel);
      }
    } catch (e) {
      throw Exception('Invalid backup file');
    }
  }

  Future _saveInvoices(Backup backup) async {
    for (var invoice in backup.invoices) {
      await repository.saveInvoice(invoice);
    }
  }
}
