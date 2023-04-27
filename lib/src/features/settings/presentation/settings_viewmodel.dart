import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/domain/usecases/get_bank_info.dart';
import 'package:invoice_app/src/core/domain/usecases/get_company_address.dart';
import 'package:invoice_app/src/core/domain/usecases/get_company_name.dart';
import 'package:invoice_app/src/core/domain/usecases/save_bank_info.dart';
import 'package:invoice_app/src/core/domain/usecases/save_company_address.dart';
import 'package:invoice_app/src/core/domain/usecases/save_company_name.dart';
import 'package:mobx/mobx.dart';

part 'settings_viewmodel.g.dart';

@injectable
class SettingsViewModel extends _SettingsViewModelBase
    with _$SettingsViewModel {
  SettingsViewModel(
    super._getCompanyName,
    super._getCompanyAddress,
    super._getBankInfo,
    super._saveCompanyName,
    super._saveCompanyAddress,
    super._saveBankInfo,
  );
}

abstract class _SettingsViewModelBase with Store {
  final IGetCompanyName _getCompanyName;
  final IGetCompanyAddress _getCompanyAddress;
  final IGetBankInfo _getBankInfo;
  final ISaveCompanyName _saveCompanyName;
  final ISaveCompanyAddress _saveCompanyAddress;
  final ISaveBankInfo _saveBankInfo;

  _SettingsViewModelBase(
    this._getCompanyName,
    this._getCompanyAddress,
    this._getBankInfo,
    this._saveCompanyName,
    this._saveCompanyAddress,
    this._saveBankInfo,
  ) {
    compNameController.text = _getCompanyName.get() ?? "";
    compAddressController.text = _getCompanyAddress.get() ?? "";
    // companyAddress = _getCompanyAddress.get();
    // bankInformation = _getBankInfo.get().toString();
  }

  var compNameController = TextEditingController();
  var compAddressController = TextEditingController();
  var beneficiaryNameController = TextEditingController();
  var ibanController = TextEditingController();
  var swiftController = TextEditingController();
  var bankNameController = TextEditingController();
  var bankAddressController = TextEditingController();
  var intSwiftController = TextEditingController();
  var intBankNameController = TextEditingController();
  var intBankAddressController = TextEditingController();
  var intIbanController = TextEditingController();


  Future updateCompanyName(String value) async {
    await _saveCompanyName.save(value);
    compNameController.text = _getCompanyName.get() ?? "";
  }

  Future updateCompanyAddress(String value) async {
    await _saveCompanyAddress.save(value);
    compAddressController.text = _getCompanyAddress.get() ?? "";
  }

  Future updateBeneficiaryName(String value) async {
    //TODO
  }

  Future updateIban(String value) async {
    //TODO
  }

  Future updateSwiftCode(String value) async {
    //TODO
  }

  Future updateBankName(String value) async {
    //TODO
  }

  Future updateBankAddress(String value) async {
    //TODO
  }

  Future updateIntSwiftCode(String value) async {
    //TODO
  }

  Future updateIntBankNameCode(String value) async {
    //TODO
  }

  Future updateIntBankAddress(String value) async {
    //TODO
  }

  Future updateIntIban(String value) async {
    //TODO
  }
}
