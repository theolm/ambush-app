import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/domain/data_models/bank.dart';
import 'package:invoice_app/src/core/domain/usecases/get_bank_info.dart';
import 'package:invoice_app/src/core/domain/usecases/save_bank_info.dart';
import 'package:invoice_app/src/core/domain/data_models/bank_info.dart';
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

    if (bankInfo != null) {
      beneficiaryNameController.text = bankInfo.beneficiaryName;

      ibanController.text = bankInfo.main.iban;
      swiftController.text = bankInfo.main.swift;
      bankNameController.text = bankInfo.main.bankName;
      bankAddressController.text = bankInfo.main.bankAddress;

      if (bankInfo.intermediary != null) {
        isIntermediaryBankEnabled = true;
        intIbanController.text = bankInfo.intermediary!.iban;
        intSwiftController.text = bankInfo.intermediary!.swift;
        intBankNameController.text = bankInfo.intermediary!.bankName;
        intBankAddressController.text = bankInfo.intermediary!.bankAddress;
      }
    }
  }

  final formKey = GlobalKey<FormState>();
  final beneficiaryNameController = TextEditingController();
  final ibanController = TextEditingController();
  final swiftController = TextEditingController();
  final bankNameController = TextEditingController();
  final bankAddressController = TextEditingController();
  final intSwiftController = TextEditingController();
  final intBankNameController = TextEditingController();
  final intBankAddressController = TextEditingController();
  final intIbanController = TextEditingController();

  @observable
  bool isIntermediaryBankEnabled = false;

  @action
  void setIntermediaryBankEnabled(bool value) {
    isIntermediaryBankEnabled = value;
  }

  Future saveBankInfo() async {
    var mainBank = _buildMainBank();

    var intermediaryBank =
        isIntermediaryBankEnabled ? _buildIntermediaryBank() : null;

    var bankInfo = BankInfo(
      beneficiaryNameController.text,
      mainBank,
      intermediaryBank,
    );

    await _saveBankInfo.save(bankInfo);
  }

  Bank _buildMainBank() => Bank(
        ibanController.text,
        swiftController.text,
        bankNameController.text,
        bankAddressController.text,
      );

  Bank _buildIntermediaryBank() => Bank(
        intIbanController.text,
        intSwiftController.text,
        intBankNameController.text,
        intBankAddressController.text,
      );
}
