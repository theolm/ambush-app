import 'package:injectable/injectable.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

abstract class IPdfTemplateRepo {
  pw.Document getDocument();
}

@Injectable(as: IPdfTemplateRepo)
class PdfTemplateRepo implements IPdfTemplateRepo {
  @override
  pw.Document getDocument() {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text("Hello World dasdsa dsa"),
          ); // Center
        },
      ),
    ); // Page


    return pdf;
  }
}
