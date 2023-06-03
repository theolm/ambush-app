import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/domain/data_models/currency.dart';
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
    if (initialInfo != null) {
      _currency = initialInfo.currency;
      currencyController.text = initialInfo.currency.cc;
      descriptionController.text = initialInfo.description;
      quantityController.text = initialInfo.quantity.toString();
      priceController.text = initialInfo.price.toString();
    }
  }

  Currency? _currency;
  final formKey = GlobalKey<FormState>();
  final descriptionController = TextEditingController();
  final quantityController = TextEditingController();
  final currencyController = TextEditingController();
  final priceController = TextEditingController();

  void setSelectedCurrency(Currency selected) {
    _currency = selected;
    currencyController.text = selected.cc;
  }

  Future saveInfo() async {
    var quantity = double.tryParse(quantityController.text);
    var price = double.tryParse(priceController.text);

    if (quantity == null || price == null || _currency == null) {
      //Treat error
      return;
    }

    var info = ServiceInfo(
      descriptionController.text,
      quantity,
      _currency!,
      price,
    );

    await _saveServiceInfo.save(info);
  }
}
