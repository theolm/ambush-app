import 'package:ambush_app/src/domain/models/currency.dart';
import 'package:extended_masked_text/extended_masked_text.dart';

class ServiceInfo {
  final String description;
  final double quantity;
  final Currency currency;
  final double price;

  ServiceInfo(this.description, this.quantity, this.currency, this.price);

  double getTotalPrice() => quantity * price;

  String getFormattedTotalPrice() {
    final mask = MoneyMaskedTextController();
    mask.updateValue(price);
    return mask.text;
  }

  String formattedQuantity() {
    return quantity.toStringAsFixed(12);
  }
}
