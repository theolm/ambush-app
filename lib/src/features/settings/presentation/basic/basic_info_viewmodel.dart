import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/domain/usecases/get_company_address.dart';
import 'package:invoice_app/src/core/domain/usecases/get_company_name.dart';
import 'package:invoice_app/src/core/domain/usecases/save_company_address.dart';
import 'package:invoice_app/src/core/domain/usecases/save_company_name.dart';
import 'package:mobx/mobx.dart';

part 'basic_info_viewmodel.g.dart';

@injectable
class BasicInfoViewModel extends _BasicInfoViewModelBase
    with _$BasicInfoViewModel {
  BasicInfoViewModel(
    super._getCompanyName,
    super._getCompanyAddress,
    super._saveCompanyName,
    super._saveCompanyAddress,
  );
}

abstract class _BasicInfoViewModelBase with Store {
  final IGetCompanyName _getCompanyName;
  final IGetCompanyAddress _getCompanyAddress;
  final ISaveCompanyName _saveCompanyName;
  final ISaveCompanyAddress _saveCompanyAddress;

  _BasicInfoViewModelBase(
    this._getCompanyName,
    this._getCompanyAddress,
    this._saveCompanyName,
    this._saveCompanyAddress,
  ) {
    compNameController.text = _getCompanyName.get() ?? "";
    compAddressController.text = _getCompanyAddress.get() ?? "";
  }

  var compNameController = TextEditingController();
  var compAddressController = TextEditingController();

  Future save() async {
    await _saveCompanyName.save(compNameController.text);
    await _saveCompanyAddress.save(compAddressController.text);
  }
}
