import 'package:ambush_app/src/domain/models/ambush_info.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:ambush_app/src/domain/usecases/get_service_info.dart';
import 'package:ambush_app/src/domain/usecases/save_service_info.dart';
import 'package:ambush_app/src/domain/models/service_info.dart';
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
    if (initialInfo != null) {
      currencyController.text = initialInfo.currency.cc;
      descriptionController.text = initialInfo.description;
      quantityController.text = initialInfo.quantity.toString();
      priceController.text = initialInfo.price.toString();
    }
  }

  final descriptionController = TextEditingController();
  final quantityController = TextEditingController();
  final currencyController = TextEditingController();
  final priceController = TextEditingController();

  @observable
  bool switchValue = true;

  @action
  void onSwitchClicked(bool value) {
    switchValue = value;
  }

  ServiceInfo? getServiceInfo() {
    var quantity = double.tryParse(quantityController.text);
    var price = double.tryParse(priceController.text);

    if (quantity == null || price == null) {
      //Treat error
      return null;
    }

    return ServiceInfo(
      descriptionController.text,
      quantity,
      defaultCurrency,
      price,
    );
  }

  Future saveInfo(ServiceInfo serviceInfo) async {
    await _saveServiceInfo.save(serviceInfo);
  }
}
