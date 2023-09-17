import 'package:injectable/injectable.dart';
import 'package:ambush_app/src/domain/models/invoice.dart';
import 'package:ambush_app/src/domain/usecases/generate_invoice.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:universal_html/html.dart' as webFile;

abstract class IShareInvoice {
  Future<void> share(Invoice invoice);
}

@Injectable(as: IShareInvoice)
class ShareInvoice implements IShareInvoice {
  final IGenerateInvoiceUseCase _generateInvoiceUseCase;

  ShareInvoice(this._generateInvoiceUseCase);

  @override
  Future<void> share(Invoice invoice) async {
    var pdf = _generateInvoiceUseCase.createPdf(invoice);

    if (kIsWeb) {
      final bytes = await pdf.save() ;
      var blob = webFile.Blob([bytes], 'application/pdf', 'native');
      webFile.AnchorElement(
        href: webFile.Url.createObjectUrlFromBlob(blob).toString(),
      )..setAttribute("download", "invoice.pdf")..click();
    } else {
      final file = await _generateInvoiceUseCase.savePdf(invoice, pdf);
      await Share.shareXFiles([XFile(file.path)]);
    }
  }
}
