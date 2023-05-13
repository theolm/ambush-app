import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/data/models/hive_invoice.dart';
import '../../data/repositories/pdf_template_repo.dart';

abstract class IGenerateInvoiceUseCase {
  Future<File> createAndSavePDF(HiveInvoice invoice);
}

@Injectable(as: IGenerateInvoiceUseCase)
class GenerateInvoiceUseCase implements IGenerateInvoiceUseCase {
  IPdfTemplateRepo pdfTemplateRepo;

  GenerateInvoiceUseCase(this.pdfTemplateRepo);

  @override
  Future<File> createAndSavePDF(HiveInvoice invoice) async {
    //TODO: include web support
    final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    final pdf = pdfTemplateRepo.getDocument(invoice);
    final file = File("${appDocumentsDir.path}/invoice_${invoice.id}.pdf");
    return file.writeAsBytes(await pdf.save());
  }
}
