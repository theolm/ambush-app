import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/domain/data_models/invoice.dart';
import 'package:invoice_app/src/features/add_invoice/data/repositories/pdf_template_repo.dart';
import 'package:path_provider/path_provider.dart';


abstract class IGenerateInvoiceUseCase {
  Future<File> createAndSavePDF(Invoice invoice);
}

@Injectable(as: IGenerateInvoiceUseCase)
class GenerateInvoiceUseCase implements IGenerateInvoiceUseCase {
  IPdfTemplateRepo pdfTemplateRepo;

  GenerateInvoiceUseCase(this.pdfTemplateRepo);

  @override
  Future<File> createAndSavePDF(Invoice invoice) async {
    //TODO: include web support
    final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    final pdf = pdfTemplateRepo.getDocument(invoice);
    final file = File("${appDocumentsDir.path}/invoice_${invoice.id}.pdf");
    return file.writeAsBytes(await pdf.save());
  }
}
