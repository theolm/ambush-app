import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:ambush_app/src/domain/models/invoice.dart';

class PdfWidgets {
  pw.Widget getTitle(Invoice invoice) => pw.Text(
        "INVOICE #${invoice.id}",
        style: pw.TextStyle(
          fontSize: 24,
          fontWeight: pw.FontWeight.bold,
        ),
      );

  pw.Text getLabel(String label) => pw.Text(
        label,
        style: const pw.TextStyle(
          color: PdfColors.grey,
          fontSize: 10,
        ),
      );

  pw.Widget getDatesBlock(Invoice invoice) => pw.Table(
        columnWidths: {
          0: const pw.FlexColumnWidth(1),
          1: const pw.FlexColumnWidth(3),
        },
        children: [
          pw.TableRow(
            children: [
              getLabel("Issue Date"),
              pw.Text(
                _formatDate(DateTime.fromMillisecondsSinceEpoch(invoice.issueDate)),
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.normal,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          pw.TableRow(children: [pw.SizedBox(height: 2)]),
          pw.TableRow(
            children: [
              getLabel("Due Date"),
              pw.Text(
                _formatDate(DateTime.fromMillisecondsSinceEpoch(invoice.dueDate)),
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.normal,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      );

  pw.Widget getCompanyBlock(
    String label,
    String name,
    String address,
    String email,
  ) =>
      pw.Table(
        columnWidths: {
          0: const pw.FlexColumnWidth(1),
          1: const pw.FlexColumnWidth(3),
        },
        children: [
          pw.TableRow(
            verticalAlignment: pw.TableCellVerticalAlignment.middle,
            children: [
              getLabel(label),
              pw.Text(
                name,
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          pw.TableRow(children: [pw.SizedBox(height: 2)]),
          pw.TableRow(
            verticalAlignment: pw.TableCellVerticalAlignment.middle,
            children: [
              pw.Container(),
              pw.Text(
                address,
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.normal,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          pw.TableRow(children: [pw.SizedBox(height: 2)]),
          pw.TableRow(
            verticalAlignment: pw.TableCellVerticalAlignment.middle,
            children: [
              pw.Container(),
              pw.Text(
                email,
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.normal,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      );

  pw.Widget getServiceLabel(String text) => pw.Padding(
        padding: const pw.EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        child: pw.Text(
          text,
          style: pw.TextStyle(
            fontWeight: pw.FontWeight.bold,
            fontSize: 8,
            lineSpacing: 1.5,
          ),
        ),
      );

  pw.Widget getServiceText(String text) => pw.Padding(
        padding: const pw.EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        child: pw.Text(
          text,
          style: pw.TextStyle(
            fontWeight: pw.FontWeight.normal,
            fontSize: 10,
          ),
        ),
      );

  pw.Widget getBankRow(String label, String value) => pw.Row(
        children: [
          getLabel(label),
          pw.SizedBox(width: 4),
          pw.Text(
            value,
            style: pw.TextStyle(
              fontWeight: pw.FontWeight.normal,
              fontSize: 10,
            ),
          )
        ],
      );

  String _formatDate(DateTime date) => DateFormat('dd/MMM/yyyy').format(date);
}
