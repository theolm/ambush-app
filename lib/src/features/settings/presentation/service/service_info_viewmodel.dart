import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/domain/usecases/get_service_info.dart';
import 'package:invoice_app/src/core/domain/usecases/save_service_info.dart';
import 'package:invoice_app/src/core/domain/data_models/service_info.dart';
import 'package:mobx/mobx.dart';

part 'service_info_viewmodel.g.dart';

@injectable
class ServiceInfoViewModel extends _ServiceInfoViewModelBase
    with _$ServiceInfoViewModel {
  ServiceInfoViewModel(super._getServiceInfo, super._saveServiceInfo);
}

abstract class _ServiceInfoViewModelBase with Store {
  final IGetServiceInfo _getServiceInfo;
  final ISaveServiceInfo _saveServiceInfo;

  _ServiceInfoViewModelBase(this._getServiceInfo, this._saveServiceInfo) {
    var initialInfo = _getServiceInfo.get();
    if(initialInfo != null) {
      descriptionController.text = initialInfo.description;
      quantityController.text = initialInfo.quantity.toString();
      currencyController.text = initialInfo.currency;
      priceController.text = initialInfo.price.toString();
    }
  }

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

    await _saveServiceInfo.save(info);
  }
}
