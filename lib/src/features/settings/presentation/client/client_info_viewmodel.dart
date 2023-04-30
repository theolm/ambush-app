import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/domain/usecases/get_client_info.dart';
import 'package:invoice_app/src/core/domain/usecases/save_client_info.dart';
import 'package:invoice_app/src/features/settings/domain/models/client_info.dart';
import 'package:mobx/mobx.dart';

part 'client_info_viewmodel.g.dart';

@injectable
class ClientInfoViewModel extends _ClientInfoViewModelBase
    with _$ClientInfoViewModel {
  ClientInfoViewModel(super._getClientInfo, super._saveClientInfo);
}

abstract class _ClientInfoViewModelBase with Store {
  final IGetClientInfo _getClientInfo;
  final ISaveClientInfo _saveClientInfo;

  _ClientInfoViewModelBase(this._getClientInfo, this._saveClientInfo) {
    var initialData = _getClientInfo.get();

    if(initialData != null) {
      nameController.text = initialData.name;
      addressController.text = initialData.address;
    }
  }

  var nameController = TextEditingController();
  var addressController = TextEditingController();

  Future<void> saveInfo() async {
    var clientInfo = ClientInfo(
      nameController.text,
      addressController.text,
    );

    await _saveClientInfo.save(clientInfo);
  }
}
