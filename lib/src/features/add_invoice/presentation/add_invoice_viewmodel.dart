import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'add_invoice_viewmodel.g.dart';

@injectable
class AddInvoiceViewModel extends _AddInvoiceViewModelBase
    with _$AddInvoiceViewModel {
  AddInvoiceViewModel();
}

abstract class _AddInvoiceViewModelBase with Store {
  var idController = TextEditingController();
  var issueDateController = TextEditingController();
  var dueDateController = TextEditingController();
  var serviceController = TextEditingController();
  var priceController = TextEditingController();
  var quantityController = TextEditingController();

  Future generateInvoice() async {

  }
}
