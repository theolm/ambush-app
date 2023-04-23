import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'my_company_viewmodel.g.dart';

@injectable
class MyCompanyViewModel extends _MyCompanyViewModelBase
    with _$MyCompanyViewModel {}

abstract class _MyCompanyViewModelBase with Store {
  _MyCompanyViewModelBase();

  final formKey = GlobalKey<FormState>();
  bool _isFormValid = false;

  String companyName = "";
  String companyAddress = "";

  void onSavePress() {
    if(_validateFields()) {
      //TODO: save data
    }
  }

  void onChange(String value) {
    if(value.isNotEmpty && !_isFormValid) {
      _validateFields();
    }
  }
  
  bool _validateFields() {
    _isFormValid = formKey.currentState!.validate();
    return _isFormValid;
  } 
}
