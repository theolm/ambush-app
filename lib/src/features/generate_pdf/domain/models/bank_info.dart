class BankInfo {
  final String beneficiaryName;
  final String iban;
  final String swift;
  final String bankName;
  final String bankAddress;
  final String? intermediaryBankSwift;
  final String? intermediaryBankName;
  final String? intermediaryBankAddress;
  final String? intermediaryAccNumber;

  BankInfo(
    this.beneficiaryName,
    this.iban,
    this.swift,
    this.bankName,
    this.bankAddress,
    this.intermediaryBankSwift,
    this.intermediaryBankName,
    this.intermediaryBankAddress,
    this.intermediaryAccNumber,
  );

  factory BankInfo.initDefault() => BankInfo(
        "",
        "",
        "",
        "",
        "",
        null,
        null,
        null,
        null,
      );
}
