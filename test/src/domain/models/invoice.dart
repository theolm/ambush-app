import 'package:flutter_test/flutter_test.dart';

import 'models_mocks.dart';

void main() {
  group('Invoice', () {
    test('Given quantity 2.0 and price 50.0, when formattedQuantity is called, then it should return 2', () {
      final serviceInfo = testServiceInfo.copyWith(quantity: 2.0, price: 50.0);
      final invoice = testInvoice.copyWith(service: serviceInfo);
      expect(invoice.formattedQuantity(), '2');
    });

    test('Given quantity 2.0 and price 50.0, when formattedPrice is called, then it should return US\$ 50.00', () {
      final serviceInfo = testServiceInfo.copyWith(quantity: 2.0, price: 50.0);
      final invoice = testInvoice.copyWith(service: serviceInfo);
      expect(invoice.formattedPrice("US\$ "), 'US\$ 50.00');
    });

    test('Given quantity 2.0 and price 50.0, when formattedTotalPrice is called, then it should return US\$ 100.000', () {
      final serviceInfo = testServiceInfo.copyWith(quantity: 2.0, price: 50.0);
      final invoice = testInvoice.copyWith(service: serviceInfo);
      expect(invoice.formattedTotalPrice("US\$ "), 'US\$ 100.00');
    });

    test('Given quantity 0.0 and price 50.0, when formattedQuantity and formattedTotalPrice are called, then they should return 0 and US\$ 0.00 respectively', () {
      final serviceInfo = testServiceInfo.copyWith(quantity: 0.0, price: 50.0);
      final invoice = testInvoice.copyWith(service: serviceInfo);
      expect(invoice.formattedQuantity(), '0');
      expect(invoice.formattedTotalPrice("US\$ "), 'US\$ 0.00');
    });

    test('Given quantity 1.0 and price 1000.0, when formattedQuantity and formattedTotalPrice are called, then they should return 0 and US\$ 1,000.00 respectively', () {
      final serviceInfo = testServiceInfo.copyWith(quantity: 1.0, price: 1000.0);
      final invoice = testInvoice.copyWith(service: serviceInfo);
      expect(invoice.formattedQuantity(), '1');
      expect(invoice.formattedTotalPrice("US\$ "), 'US\$ 1,000.00');
    });

    test('Given quantity 2.0 and price 0.0, when formattedPrice and formattedTotalPrice are called, then they should return 0.00 and US\$ 0.00 respectively', () {
      final serviceInfo = testServiceInfo.copyWith(quantity: 2.0, price: 0.0);
      final invoice = testInvoice.copyWith(service: serviceInfo);
      expect(invoice.formattedPrice("US\$ "), 'US\$ 0.00');
      expect(invoice.formattedTotalPrice("US\$ "), 'US\$ 0.00');
    });
  });
}
