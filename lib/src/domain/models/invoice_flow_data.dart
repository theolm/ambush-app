import 'package:invoice_app/src/domain/models/bank_info.dart';
import 'package:invoice_app/src/domain/models/client_info.dart';
import 'package:invoice_app/src/domain/models/comp_info.dart';
import 'package:invoice_app/src/domain/models/service_info.dart';

class InvoiceFlowData {
  ServiceInfo? service;
  CompanyInfo? companyInfo;
  ClientInfo? clientInfo;
  BankInfo? bankInfo;

  void validateData() {
    if (service == null) {
      throw Exception("Service info is null");
    }
    if (companyInfo == null) {
      throw Exception("Company info is null");
    }
    if (clientInfo == null) {
      throw Exception("Client info is null");
    }
    if (bankInfo == null) {
      throw Exception("Bank info is null");
    }
  }
}
