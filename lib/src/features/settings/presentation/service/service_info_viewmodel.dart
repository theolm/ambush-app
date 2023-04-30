import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/features/settings/domain/models/service_info.dart';
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

  Future saveInfo() async {
    var quantity = double.tryParse(quantityController.text);
    var price = double.tryParse(priceController.text);

    if(quantity == null || price == null) {
      //Treat error
      return;
    }

    var info = ServiceInfo(
        descriptionController.text, quantity, currencyController.text, price);
  }
}
