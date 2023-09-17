import 'package:ambush_app/src/domain/models/currency.dart';

class ServiceInfo {
  final String description;
  final double quantity;
  final Currency currency;
  final double price;

  ServiceInfo(this.description, this.quantity, this.currency, this.price);

  double getTotalPrice() => quantity * price;

  String getFormattedTotalPrice() => getTotalPrice().toStringAsFixed(2);
}
