import 'package:hive/hive.dart';
import 'package:invoice_app/src/features/settings/domain/models/bank_info.dart';

part 'hive_bank_info.g.dart';

@HiveType(typeId: 2)
class HiveBankInfo extends HiveObject {
  @HiveField(0)
  String? beneficiaryName;

  @HiveField(1)
  String? iban;

  @HiveField(2)
  String? swift;

  @HiveField(3)
  String? bankName;

  @HiveField(4)
  String? bankAddress;

  @HiveField(5)
  String? intermediaryBankSwift;

  @HiveField(6)
  String? intermediaryBankName;

  @HiveField(7)
  String? intermediaryBankAddress;

  @HiveField(8)
  String? intermediaryAccNumber;

  BankInfo toBankInfo() => BankInfo(
        beneficiaryName!,
        iban!,
        swift!,
        bankName!,
        bankAddress!,
        intermediaryBankSwift,
        intermediaryBankName,
        intermediaryBankAddress,
        intermediaryAccNumber,
      );

  static HiveBankInfo fromBankInfo(BankInfo bankInfo) {
    HiveBankInfo hiveBankInfo = HiveBankInfo();
    hiveBankInfo.beneficiaryName = bankInfo.beneficiaryName;
    hiveBankInfo.iban = bankInfo.iban;
    hiveBankInfo.swift = bankInfo.swift;
    hiveBankInfo.bankName = bankInfo.bankName;
    hiveBankInfo.bankAddress = bankInfo.bankAddress;
    hiveBankInfo.intermediaryBankSwift = bankInfo.intermediaryBankSwift;
    hiveBankInfo.intermediaryBankName = bankInfo.intermediaryBankName;
    hiveBankInfo.intermediaryAccNumber = bankInfo.intermediaryAccNumber;
    return hiveBankInfo;
  }
}
