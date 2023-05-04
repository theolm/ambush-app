import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/domain/usecases/get_bank_info.dart';
import 'package:invoice_app/src/core/domain/usecases/save_bank_info.dart';
import 'package:invoice_app/src/features/settings/domain/models/bank_info.dart';
import 'package:mobx/mobx.dart';

part 'bank_info_viewmodel.g.dart';

@injectable
class BankInfoViewModel extends _BankInfoViewModelBase
    with _$BankInfoViewModel {
  BankInfoViewModel(super._getBankInfo, super._saveBankInfo);
}

abstract class _BankInfoViewModelBase with Store {
  final IGetBankInfo _getBankInfo;
  final ISaveBankInfo _saveBankInfo;

  _BankInfoViewModelBase(this._getBankInfo, this._saveBankInfo) {
    var bankInfo = _getBankInfo.get();
    beneficiaryNameController.text = bankInfo.beneficiaryName;
    bankNameController.text = bankInfo.beneficiaryName;
    ibanController.text = bankInfo.iban;
    swiftController.text = bankInfo.swift;
    bankNameController.text = bankInfo.bankName;
    bankAddressController.text = bankInfo.bankAddress;
    intSwiftController.text = bankInfo.intermediaryBankSwift ?? "";
    intBankNameController.text = bankInfo.intermediaryBankName ?? "";
    intBankAddressController.text = bankInfo.intermediaryBankAddress ?? "";
    intIbanController.text = bankInfo.intermediaryAccNumber ?? "";
  }

  var beneficiaryNameController = TextEditingController();
  var ibanController = TextEditingController();
  var swiftController = TextEditingController();
  var bankNameController = TextEditingController();
  var bankAddressController = TextEditingController();
  var intSwiftController = TextEditingController();
  var intBankNameController = TextEditingController();
  var intBankAddressController = TextEditingController();
  var intIbanController = TextEditingController();

  Future saveBankInfo() async {
    var bankInfo = BankInfo(
      beneficiaryNameController.text,
      ibanController.text,
      swiftController.text,
      bankNameController.text,
      bankAddressController.text,
      intSwiftController.text.isEmpty ? intSwiftController.text : null,
      intBankNameController.text.isEmpty ? intBankNameController.text : null,
      intBankAddressController.text.isEmpty
          ? intBankAddressController.text
          : null,
      intIbanController.text.isEmpty ? intIbanController.text : null,
    );
    await _saveBankInfo.save(bankInfo);
  }
}
