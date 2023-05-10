import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/data/models/hive_invoice.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

abstract class IPdfTemplateRepo {
  pw.Document getDocument(HiveInvoice invoice);
}

@Injectable(as: IPdfTemplateRepo)
class PdfTemplateRepo implements IPdfTemplateRepo {
  @override
  pw.Document getDocument(HiveInvoice invoice) {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return _getPage(invoice);
        },
      ),
    ); // Page

    return pdf;
  }

  pw.Container _getPage(HiveInvoice invoice) {
    return pw.Container(
      padding: const pw.EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Flexible(
                child:
                _getHeader(invoice.name),
                flex: 1,
              ),
              pw.Flexible(
                child: pw.Container(
                  width: double.infinity,
                  child: pw.Text(
                    "Invoice #${invoice.id}",
                    style: const pw.TextStyle(fontSize: 20),
                    textAlign: pw.TextAlign.right,
                  ),
                ),
                flex: 1,
              ),
            ],
          ),
          pw.Container(height: 16),
          _getDate(invoice.issueDate, invoice.dueDate),
          pw.Container(height: 16),
           pw.Divider(),
          pw.Container(height: 16),
          _getBill("Bill from:", invoice.name, invoice.address),
          pw.Container(height: 16),
          _getBill("Bill to:", invoice.clientName, invoice.clientAddress),
          pw.Container(height: 16),
          pw.Row(
            children: [
              pw.Text("Services",
                  style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
              pw.Spacer(),
              pw.Text("Amount",
                  style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
            ],
          ),
          pw.Divider(),
          pw.Container(height: 8),
          _service(
              "Other services",
              invoice.description,
              "${invoice.currency} ${invoice.getTotalPrice()}"),
          pw.Container(height: 8),
          pw.Divider(),
          pw.Container(height: 16),
          _getTotal("${invoice.currency} ${invoice.getTotalPrice()}"),
          pw.Container(height: 32),
          _bankInfo(invoice),
        ],
      ),
    );
  }

  pw.Column _getHeader(String name) {
    return pw.Column(
      mainAxisAlignment: pw.MainAxisAlignment.start,
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(name, style: const pw.TextStyle(fontSize: 20)),
        // pw.Text("CNPJ: $cnpj", style: const pw.TextStyle(fontSize: 12)),
      ],
    );
  }

  pw.Column _getDate(String creation, String due) {
    return pw.Column(
      mainAxisAlignment: pw.MainAxisAlignment.start,
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.end,
          children: [
            pw.Text(
              "Creation date:",
              style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
            ),
            pw.Container(width: 4),
            pw.Text(
              creation,
              style: const pw.TextStyle(fontSize: 12),
            ),
          ],
        ),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.end,
          children: [
            pw.Text(
              "Due date:",
              style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
            ),
            pw.Container(width: 4),
            pw.Text(
              due,
              style: const pw.TextStyle(fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }

  pw.Column _getBill(
    String header,
    String from,
    String address,
  ) {
    return pw.Column(
      mainAxisAlignment: pw.MainAxisAlignment.start,
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          header,
          style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
        ),
        pw.Text(
          from, //,
          style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
        ),
        pw.Row(children: [
          pw.Flexible(
            child: pw.Container(
              width: double.infinity,
              child: pw.Text(
                address, //,
                style: pw.TextStyle(
                    fontSize: 12, fontWeight: pw.FontWeight.normal),
              ),
            ),
          ),
          pw.Flexible(child: pw.Container(width: double.infinity)),
        ]),
      ],
    );
  }

  pw.Column _service(String service, String description, String amount) {
    return pw.Column(
      mainAxisAlignment: pw.MainAxisAlignment.start,
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          service,
          style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.normal),
        ),
        pw.Row(
          children: [
            pw.Flexible(
              child: pw.Text(
                description,
                style: pw.TextStyle(
                    fontSize: 12, fontWeight: pw.FontWeight.normal),
              ),
            ),
            pw.Container(width: 4),
            pw.Text(
              amount,
              style:
                  pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.normal),
            ),
          ],
        ),
      ],
    );
  }

  pw.Container _getTotal(String amount) {
    return pw.Container(
      width: double.infinity,
      padding: const pw.EdgeInsets.all(16),
      decoration: pw.BoxDecoration(
          color: PdfColor.fromHex("#FF0000"),
          borderRadius: const pw.BorderRadius.all(pw.Radius.circular(16))),
      alignment: pw.Alignment.centerRight,
      child: pw.Text(
        amount,
        style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.normal),
      ),
    );
  }

  pw.Column _bankInfo(HiveInvoice invoice) {
    return pw.Column(
      mainAxisAlignment: pw.MainAxisAlignment.start,
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          "Pay to banking details below:",
          style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
        ),
        pw.Container(height: 8),
        pw.Row(
          children: [
            pw.Text(
              "Beneficiary name:",
              style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
            ),
            pw.Text(
              invoice.beneficiaryName,
              style:
                  pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.normal),
            ),
          ],
        ),
        pw.Row(
          children: [
            pw.Text(
              "Beneficiary Account Number (IBAN):",
              style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
            ),
            pw.Text(
              invoice.iban,
              style:
                  pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.normal),
            ),
          ],
        ),
        pw.Row(
          children: [
            pw.Text(
              "SWIFT Code:",
              style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
            ),
            pw.Text(
              invoice.swift,
              style:
                  pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.normal),
            ),
          ],
        ),
        pw.Row(
          children: [
            pw.Text(
              "Bank Name:",
              style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
            ),
            pw.Text(
              invoice.bankName,
              style:
                  pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.normal),
            ),
          ],
        ),
        pw.Row(
          children: [
            pw.Text(
              "Bank Address:",
              style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
            ),
            pw.Text(
              invoice.bankAddress,
              style:
                  pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.normal),
            ),
          ],
        ),
      ],
    );
  }
}
