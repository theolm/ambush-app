import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/features/settings/domain/models/client_info.dart';
import 'package:mobx/mobx.dart';

part 'client_info_viewmodel.g.dart';

@injectable
class ClientInfoViewModel extends _ClientInfoViewModelBase
    with _$ClientInfoViewModel {
  ClientInfoViewModel();
}

abstract class _ClientInfoViewModelBase with Store {
  var nameController = TextEditingController();
  var addressController = TextEditingController();

  Future<void> saveInfo() async {
    var clientInfo = ClientInfo(
      nameController.text,
      addressController.text,
    );
  }
}
