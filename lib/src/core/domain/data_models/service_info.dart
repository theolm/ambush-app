import 'package:invoice_app/src/core/domain/data_models/currency.dart';

class ServiceInfo {
  final String description;
  final double quantity;
  final Currency currency;
  final double price;

  ServiceInfo(this.description, this.quantity, this.currency, this.price);

  String getTotalPrice() {
    var total = quantity * price;
    return total.toStringAsFixed(2);
  }
}
