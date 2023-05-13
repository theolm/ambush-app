import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/domain/data_models/comp_info.dart';
import 'package:invoice_app/src/core/domain/usecases/get_company_info.dart';
import 'package:invoice_app/src/core/domain/usecases/save_company_info.dart';
import 'package:mobx/mobx.dart';

part 'basic_info_viewmodel.g.dart';

@injectable
class BasicInfoViewModel extends _BasicInfoViewModelBase
    with _$BasicInfoViewModel {
  BasicInfoViewModel(
    super._getCompanyInfo,
    super._saveCompanyInfo,
  );
}

abstract class _BasicInfoViewModelBase with Store {
  final IGetCompanyInfo _getCompanyInfo;
  final ISaveCompanyInfo _saveCompanyInfo;

  _BasicInfoViewModelBase(
    this._getCompanyInfo,
    this._saveCompanyInfo,
  ) {
    var info = _getCompanyInfo.get();
    if (info != null) {
      compNameController.text = info.name;
      compAddressController.text = info.address;
    }
  }

  var compNameController = TextEditingController();
  var compAddressController = TextEditingController();

  Future save() async {
    await _saveCompanyInfo.save(
      CompanyInfo(
        compNameController.text,
        compAddressController.text,
      ),
    );
  }
}
