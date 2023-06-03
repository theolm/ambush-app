import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:invoice_app/src/core/domain/data_models/currency.dart';
import 'package:invoice_app/src/core/domain/data_models/invoice.dart';
import 'package:invoice_app/src/core/domain/data_models/service_info.dart';
import 'package:invoice_app/src/core/domain/usecases/get_bank_info.dart';
import 'package:invoice_app/src/core/domain/usecases/get_client_info.dart';
import 'package:invoice_app/src/core/domain/usecases/get_company_info.dart';
import 'package:invoice_app/src/core/domain/usecases/get_next_id.dart';
import 'package:invoice_app/src/core/domain/usecases/get_service_info.dart';
import 'package:invoice_app/src/core/domain/usecases/save_invoice.dart';
import 'package:invoice_app/src/core/domain/usecases/validate_invoice_settings.dart';
import 'package:mobx/mobx.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io' show Platform;

import '../domain/usecases/generate_invoice.dart';

part 'add_invoice_viewmodel.g.dart';

@injectable
class AddInvoiceViewModel extends _AddInvoiceViewModelBase
    with _$AddInvoiceViewModel {
  AddInvoiceViewModel(
    super._getBankInfo,
    super._getClientInfo,
    super._getCompanyInfo,
    super._getServiceInfo,
    super._saveInvoice,
    super._generateInvoiceUseCase,
    super._validateInvoiceSettings,
    super._getNextId,
  );
}

abstract class _AddInvoiceViewModelBase with Store {
  final IGetBankInfo _getBankInfo;
  final IGetClientInfo _getClientInfo;
  final IGetCompanyInfo _getCompanyInfo;
  final IGetServiceInfo _getServiceInfo;
  final IValidateInvoiceSettings _validateInvoiceSettings;
  final ISaveInvoice _saveInvoice;
  final IGenerateInvoiceUseCase _generateInvoiceUseCase;
  final IGetNextId _getNextId;

  _AddInvoiceViewModelBase(
    this._getBankInfo,
    this._getClientInfo,
    this._getCompanyInfo,
    this._getServiceInfo,
    this._saveInvoice,
    this._generateInvoiceUseCase,
    this._validateInvoiceSettings,
    this._getNextId,
  ) {
    var nextId = _getNextId.get();
    if (nextId != null) {
      idController.text = nextId.toString();
    }

    var service = _getServiceInfo.get();
    if (service != null) {
      initialCurrency = service.currency;
      serviceController.text = service.description;
      quantityController.text = service.quantity.toStringAsFixed(2);
      currencyController.text = service.currency.cc;
      priceController.text = service.price.toStringAsFixed(2);
    }
  }

  Currency? initialCurrency;
  final formKey = GlobalKey<FormState>();
  final idController = TextEditingController();
  final issueDateController = TextEditingController();
  final dueDateController = TextEditingController();
  final serviceController = TextEditingController();
  final quantityController = TextEditingController();
  final currencyController = TextEditingController();
  final priceController = TextEditingController();

  DateTime? _issueDate;
  DateTime? _dueDate;

  void updateIssueDate(DateTime date) {
    _issueDate = date;
    issueDateController.text = _formatDate(date);
  }

  void updateDueDate(DateTime date) {
    _dueDate = date;
    dueDateController.text = _formatDate(date);
  }

  void setSelectedCurrency(Currency selected) {
    initialCurrency = selected;
    currencyController.text = selected.cc;
  }

  bool validateForm() => formKey.currentState!.validate();

  Future<bool> saveInvoice() async {
    if (!_validateDates()) {
      return false;
    }

    if (_validateInvoiceSettings.validate() != InvoiceSettingsStatus.ok) {
      return false;
    }

    //TODO: fix currency
    var bankInfo = _getBankInfo.get();
    var clientInfo = _getClientInfo.get();
    var companyInfo = _getCompanyInfo.get();
    var serviceInfo = ServiceInfo(
      serviceController.text,
      double.parse(quantityController.text),
      Currency("a", "a", "a"),
      double.parse(priceController.text),
    );

    var now = DateTime.now();

    var invoice = Invoice(
      int.parse(idController.text),
      _issueDate!.millisecondsSinceEpoch,
      _dueDate!.millisecondsSinceEpoch,
      serviceInfo,
      companyInfo!,
      clientInfo!,
      bankInfo!,
      now.millisecondsSinceEpoch,
      now.millisecondsSinceEpoch,
    );

    await _saveInvoice.save(invoice);
    var pdf = await _generateInvoiceUseCase.createAndSavePDF(invoice);

    if (kDebugMode) {
      print(pdf.path);
    }

    if (Platform.isAndroid || Platform.isIOS) {
      await Share.shareXFiles([XFile(pdf.path)]);
    } else {
      //TODO: show dialog with save with success
    }

    return true;
  }

  String _formatDate(DateTime date) => DateFormat('MM/dd/yyyy').format(date);

  bool _validateDates() {
    if (_issueDate == null || _dueDate == null) {
      return false;
    }

    if (!isDueDateValid()) {
      return false;
    }

    return true;
  }

  bool isDueDateValid() =>
      _dueDate!.isAfter(_issueDate!) || _dueDate!.isAtSameMomentAs(_issueDate!);
}
