import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
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
}
