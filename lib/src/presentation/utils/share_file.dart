import 'dart:convert';
import 'dart:io';
import 'package:ambush_app/src/domain/usecases/create_backup_file.dart';
import 'package:injectable/injectable.dart';
import 'package:ambush_app/src/domain/models/invoice.dart';
import 'package:ambush_app/src/domain/usecases/generate_invoice.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:universal_html/html.dart' as web_file;
import 'dart:io' show Platform;
import 'package:file_picker/file_picker.dart';

abstract class IShareFile {
  Future<void> shareInvoice(Invoice invoice);

  Future<void> shareBackup();
}

@Injectable(as: IShareFile)
class ShareFile implements IShareFile {
  final IGenerateInvoiceUseCase _generateInvoiceUseCase;
  final ICreateBackupFile _createBackupFile;

  ShareFile(this._generateInvoiceUseCase, this._createBackupFile);

  @override
  Future<void> shareInvoice(Invoice invoice) async {
    var pdf = _generateInvoiceUseCase.createPdf(invoice);

    if (kIsWeb) {
      final bytes = await pdf.save();
      var blob = web_file.Blob([bytes], 'application/pdf', 'native');
      web_file.AnchorElement(
        href: web_file.Url.createObjectUrlFromBlob(blob).toString(),
      )
        ..setAttribute("download", "invoice.pdf")
        ..click();
    } else if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
      final filePath = await FilePicker.platform.saveFile(
        dialogTitle: "Save invoice",
        allowedExtensions: ['pdf'],
        fileName: "invoice_${invoice.id}.pdf",
      );
      if (filePath != null) {
        final _ = await _generateInvoiceUseCase.savePdf(invoice, pdf, filePath);
      }
    } else {
      final file = await _generateInvoiceUseCase.savePdf(invoice, pdf, null);
      await Share.shareXFiles([XFile(file.path)]);
    }
  }

  @override
  Future<void> shareBackup() async {
    final backup = await _createBackupFile.create();
    final json = jsonEncode(backup.toJson());

    if (kIsWeb) {
      //TODO: Implement web version
    } else if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
      final filePath = await FilePicker.platform.saveFile(
        dialogTitle: "Save backup",
        allowedExtensions: ['ambush'],
        fileName: "backup_${backup.id}.ambush",
      );
      if (filePath != null) {
        final _ = await File(filePath).writeAsString(json);
      }
    } else {
      final Directory appDocumentsDir =
          await getApplicationDocumentsDirectory();
      final file = File("${appDocumentsDir.path}/backup_${backup.id}.ambush");
      final saved = await file.writeAsString(json);
      await Share.shareXFiles([XFile(saved.path)]);
    }
  }
}
