import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:ambush_app/src/data/repositories/pdf_template_repo.dart';
import 'package:ambush_app/src/domain/models/invoice.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';

abstract class IGenerateInvoiceUseCase {
  Document createPdf(Invoice invoice);

  Future<File> savePdf(Invoice invoice, Document pdf);
}

@Injectable(as: IGenerateInvoiceUseCase)
class GenerateInvoiceUseCase implements IGenerateInvoiceUseCase {
  IPdfTemplateRepo pdfTemplateRepo;

  GenerateInvoiceUseCase(this.pdfTemplateRepo);

  @override
  Document createPdf(Invoice invoice) {
    return pdfTemplateRepo.getDocument(invoice);
  }

  @override
  Future<File> savePdf(Invoice invoice, Document pdf) async {
    final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    final file = File("${appDocumentsDir.path}/invoice_${invoice.id}.pdf");
    return file.writeAsBytes(await pdf.save());
  }
}
