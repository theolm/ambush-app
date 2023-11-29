import 'package:ambush_app/src/domain/models/bank_info.dart';
import 'package:ambush_app/src/domain/models/client_info.dart';
import 'package:ambush_app/src/domain/models/comp_info.dart';
import 'package:ambush_app/src/domain/models/service_info.dart';

class Invoice {
  final int id;
  final int issueDate;
  final int dueDate;
  final ServiceInfo service;
  final CompanyInfo companyInfo;
  final ClientInfo clientInfo;
  final BankInfo bankInfo;
  final int createdAt;
  final int updatedAt;

  Invoice(
    this.id,
    this.issueDate,
    this.dueDate,
    this.service,
    this.companyInfo,
    this.clientInfo,
    this.bankInfo,
    this.createdAt,
    this.updatedAt,
  );

  String formattedQuantity() {
    return service.quantity.toStringAsFixed(12);
  }

  String formattedPrice() {
    return service.price.toStringAsFixed(2);
  }

  String formattedTotalPrice() {
    final totalPrice = service.price * service.quantity;
    return totalPrice.toStringAsFixed(3);
  }
}
