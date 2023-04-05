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
          return _getPage();
        },
      ),
    ); // Page

    return pdf;
  }

  pw.Container _getPage() {
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
                _getHeader("Theodoro Loureiro Mota", "43.556.903/0001-66"),
                flex: 1,
              ),
              pw.Flexible(
                child: pw.Container(
                  width: double.infinity,
                  child: pw.Text(
                    "Invoice #1680484",
                    style: pw.TextStyle(fontSize: 20),
                    textAlign: pw.TextAlign.right,
                  ),
                ),
                flex: 1,
              ),
            ],
          ),
          pw.Container(height: 16),
          _getDate("2023-03-27", "2023-03-27"),
          pw.Container(height: 16),
           pw.Divider(),
          pw.Container(height: 16),
          _getBill("Bill from:", "Theodoro Loureiro Mota",
              "RUA DEROCY PERES DA PALMA, nº 21, Lomba Do Pinheiro. Porto Alegre - RS, Brazil. Zip Code: 91550113"),
          pw.Container(height: 16),
          _getBill("Bill to:", "AMBUSH CONSULTING LLC",
              "7421 Burnet Rd. Suite 276 Austin, TX 78757"),
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
              "Software Development Consulting Services - Mar/2023 - Prorated",
              "USD 4,656.52"),
          pw.Container(height: 8),
          pw.Divider(),
          pw.Container(height: 16),
          _getTotal("USD 4,656.52"),
          pw.Container(height: 32),
          _bankInfo(),
        ],
      ),
    );
  }

  pw.Column _getHeader(String name, String cnpj) {
    return pw.Column(
      mainAxisAlignment: pw.MainAxisAlignment.start,
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(name, style: const pw.TextStyle(fontSize: 20)),
        pw.Text("CNPJ: $cnpj", style: const pw.TextStyle(fontSize: 12)),
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

  pw.Column _bankInfo() {
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
              "Theodoro Loureiro Mota",
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
              "BR2778632767000010002775141C1",
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
              "OURIBRSPXXX",
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
              "BANCO OURINVEST S.A.",
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
              "Sao Paulo, Brazil",
              style:
                  pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.normal),
            ),
          ],
        ),
      ],
    );
  }
}
