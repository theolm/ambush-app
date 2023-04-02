import 'dart:io';
import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import '../../data/repositories/pdf_template_repo.dart';

abstract class IGenerateInvoiceUseCase {
  Future<File> createAndSave();
}

@Injectable(as: IGenerateInvoiceUseCase)
class GenerateInvoiceUseCase implements IGenerateInvoiceUseCase {
  IPdfTemplateRepo pdfTemplateRepo;

  GenerateInvoiceUseCase(this.pdfTemplateRepo);

  @override
  Future<File> createAndSave() async {
    var random = Random().nextInt(99999); //TODO: change this
    final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    final pdf = pdfTemplateRepo.getDocument();
    final file = File("${appDocumentsDir.path}/$random.pdf");
    return file.writeAsBytes(await pdf.save());
  }
}