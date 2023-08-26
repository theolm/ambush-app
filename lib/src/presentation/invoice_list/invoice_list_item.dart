import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:invoice_app/src/domain/models/invoice.dart';

class InvoiceListItem extends StatelessWidget {
  const InvoiceListItem({super.key, required this.invoice});

  static const String _dateFormat = 'MM/dd/yy';

  final Invoice invoice;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 0,
      color: colorTheme.surfaceVariant,
      child: Container(
        padding: const EdgeInsetsDirectional.all(16),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Invoice ${invoice.id}',
              style: textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text('To: ${invoice.clientInfo.name}'),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Issued: ${formatDate(invoice.issueDate)}'),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Due: ${formatDate(invoice.dueDate)}'),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '${invoice.service.currency.symbol} ${invoice.service.getFormattedTotalPrice()}',
                style: textTheme.titleLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatDate(int timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return DateFormat(_dateFormat).format(date);
  }
}
