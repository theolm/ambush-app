class ServiceInfo {
  final String description;
  final double quantity;
  final String currency;
  final double price;

  ServiceInfo(this.description, this.quantity, this.currency, this.price);

  String getTotalPrice() {
    var total = quantity * price;
    return total.toStringAsFixed(2);
  }
}
