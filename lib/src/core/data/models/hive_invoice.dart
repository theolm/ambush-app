import 'package:hive/hive.dart';
import 'package:invoice_app/src/core/domain/data_models/bank.dart';
import 'package:invoice_app/src/core/domain/data_models/bank_info.dart';
import 'package:invoice_app/src/core/domain/data_models/client_info.dart';
import 'package:invoice_app/src/core/domain/data_models/comp_info.dart';
import 'package:invoice_app/src/core/domain/data_models/invoice.dart';
import 'package:invoice_app/src/core/domain/data_models/service_info.dart';

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

  // Service info
  @HiveField(3)
  String description;

  @HiveField(4)
  double quantity;

  @HiveField(5)
  String currency;

  @HiveField(6)
  double unitPrice;

  //My info
  @HiveField(7)
  String name;

  @HiveField(8)
  String address;

  //Client Info
  @HiveField(9)
  String clientName;

  @HiveField(10)
  String clientAddress;

  //Bank Info
  @HiveField(11)
  String beneficiaryName;

  @HiveField(12)
  String iban;

  @HiveField(13)
  String swift;

  @HiveField(14)
  String bankName;

  @HiveField(15)
  String bankAddress;

  @HiveField(16)
  String? intermediaryBankSwift;

  @HiveField(17)
  String? intermediaryBankName;

  @HiveField(18)
  String? intermediaryBankAddress;

  @HiveField(19)
  String? intermediaryAccNumber;

  @HiveField(20)
  int createdAt;

  @HiveField(21)
  int updatedAt;

  HiveInvoice(
    this.id,
    this.issueDate,
    this.dueDate,
    this.description,
    this.quantity,
    this.currency,
    this.unitPrice,
    this.name,
    this.address,
    this.clientName,
    this.clientAddress,
    this.beneficiaryName,
    this.iban,
    this.swift,
    this.bankName,
    this.bankAddress,
    this.intermediaryBankSwift,
    this.intermediaryBankName,
    this.intermediaryBankAddress,
    this.intermediaryAccNumber,
    this.createdAt,
    this.updatedAt,
  );

  factory HiveInvoice.newInvoice(
    int id,
    int issueDate,
    int dueDate,
    ServiceInfo serviceInfo,
    String companyName,
    String companyAddress,
    ClientInfo clientInfo,
    BankInfo bankInfo,
  ) {
    var now = DateTime.now();

    return HiveInvoice(
      id,
      issueDate,
      dueDate,
      serviceInfo.description,
      serviceInfo.quantity,
      serviceInfo.currency,
      serviceInfo.price,
      companyName,
      companyAddress,
      clientInfo.name,
      clientInfo.address,
      bankInfo.beneficiaryName,
      bankInfo.main.iban,
      bankInfo.main.swift,
      bankInfo.main.bankName,
      bankInfo.main.bankAddress,
      bankInfo.intermediary?.swift,
      bankInfo.intermediary?.bankName,
      bankInfo.intermediary?.bankAddress,
      bankInfo.intermediary?.iban,
      now.millisecondsSinceEpoch,
      now.millisecondsSinceEpoch,
    );
  }

  factory HiveInvoice.fromInvoice(Invoice invoice) => HiveInvoice(
        invoice.id,
        invoice.issueDate,
        invoice.dueDate,
        invoice.service.description,
        invoice.service.quantity,
        invoice.service.currency,
        invoice.service.price,
        invoice.companyInfo.name,
        invoice.companyInfo.address,
        invoice.clientInfo.name,
        invoice.clientInfo.address,
        invoice.bankInfo.beneficiaryName,
        invoice.bankInfo.main.iban,
        invoice.bankInfo.main.swift,
        invoice.bankInfo.main.bankName,
        invoice.bankInfo.main.bankAddress,
        invoice.bankInfo.intermediary?.swift,
        invoice.bankInfo.intermediary?.bankName,
        invoice.bankInfo.intermediary?.bankAddress,
        invoice.bankInfo.intermediary?.iban,
        invoice.createdAt,
        invoice.updatedAt,
      );

  Invoice toInvoice() => Invoice(
        id,
        issueDate,
        dueDate,
        ServiceInfo(description, quantity, currency, unitPrice),
        CompanyInfo(name, address),
        ClientInfo(clientName, clientAddress),
        BankInfo(
          beneficiaryName,
          Bank(iban, swift, bankName, bankAddress),
          _getIntermediaryBank(),
        ),
        createdAt,
        updatedAt,
      );

  Bank? _getIntermediaryBank() {
    if (intermediaryBankName != null &&
        intermediaryBankAddress != null &&
        intermediaryBankSwift != null &&
        intermediaryAccNumber != null) {
      return Bank(
        intermediaryAccNumber!,
        intermediaryBankSwift!,
        intermediaryBankName!,
        intermediaryBankAddress!,
      );
    } else {
      return null;
    }
  }
}
