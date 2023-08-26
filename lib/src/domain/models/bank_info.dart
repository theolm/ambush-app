import 'package:invoice_app/src/domain/models/bank.dart';

class BankInfo {
  final String beneficiaryName;
  final Bank main;
  final Bank? intermediary;

  BankInfo(
    this.beneficiaryName,
    this.main,
    this.intermediary,
  );
}
