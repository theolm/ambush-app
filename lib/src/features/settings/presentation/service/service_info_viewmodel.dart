import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'service_info_viewmodel.g.dart';

@injectable
class ServiceInfoViewModel extends _ServiceInfoViewModelBase
    with _$ServiceInfoViewModel {
  ServiceInfoViewModel();
}

abstract class _ServiceInfoViewModelBase with Store {
  var descriptionController = TextEditingController();
  var quantityController = TextEditingController();
  var currencyController = TextEditingController();
  var priceController = TextEditingController();
}
