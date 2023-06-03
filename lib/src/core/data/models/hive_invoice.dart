import 'package:hive/hive.dart';
import 'package:invoice_app/src/core/domain/data_models/bank_info.dart';
import 'package:invoice_app/src/core/domain/data_models/client_info.dart';
import 'package:invoice_app/src/core/domain/data_models/comp_info.dart';
import 'package:invoice_app/src/core/domain/data_models/invoice.dart';
import 'package:invoice_app/src/core/domain/data_models/service_info.dart';

import 'hive_bank_info.dart';
import 'hive_client_info.dart';
import 'hive_company_info.dart';
import 'hive_service_info.dart';

part 'hive_invoice.g.dart';

@HiveType(typeId: 5)
class HiveInvoice extends HiveObject {
  // Invoice basic info
  @HiveField(0)
  int id;

  @HiveField(1)
  int issueDate;

  @HiveField(2)
  int dueDate;

  @HiveField(3)
  int createdAt;

  @HiveField(4)
  int updatedAt;

  // Service info
  @HiveField(5)
  HiveServiceInfo serviceInfo;

  //My info
  @HiveField(6)
  HiveCompanyInfo companyInfo;

  //Client Info
  @HiveField(7)
  HiveClientInfo clientInfo;

  //Bank Info
  @HiveField(8)
  HiveBankInfo bankInfo;

  HiveInvoice(
    this.id,
    this.issueDate,
    this.dueDate,
    this.createdAt,
    this.updatedAt,
    this.serviceInfo,
    this.companyInfo,
    this.clientInfo,
    this.bankInfo,
  );

  factory HiveInvoice.newInvoice(
    int id,
    int issueDate,
    int dueDate,
    ServiceInfo serviceInfo,
    CompanyInfo companyInfo,
    ClientInfo clientInfo,
    BankInfo bankInfo,
  ) {
    var now = DateTime.now();

    return HiveInvoice(
      id,
      issueDate,
      dueDate,
      now.millisecondsSinceEpoch,
      now.millisecondsSinceEpoch,
      HiveServiceInfo.fromServiceInfo(serviceInfo),
      HiveCompanyInfo.fromDataModel(companyInfo),
      HiveClientInfo.from(clientInfo),
      HiveBankInfo.fromDataModel(bankInfo),
    );
  }

  factory HiveInvoice.fromInvoice(Invoice invoice) => HiveInvoice(
        invoice.id,
        invoice.issueDate,
        invoice.dueDate,
        invoice.createdAt,
        invoice.updatedAt,
        HiveServiceInfo.fromServiceInfo(invoice.service),
        HiveCompanyInfo.fromDataModel(invoice.companyInfo),
        HiveClientInfo.from(invoice.clientInfo),
        HiveBankInfo.fromDataModel(invoice.bankInfo),
      );

  Invoice toInvoice() => Invoice(
        id,
        issueDate,
        dueDate,
        serviceInfo.toServiceInfo(),
        companyInfo.toDataModel(),
        clientInfo.toClientInfo(),
        bankInfo.toDataModel(),
        createdAt,
        updatedAt,
      );
}
