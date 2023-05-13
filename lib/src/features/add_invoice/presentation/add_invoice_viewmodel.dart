import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/data/models/hive_invoice.dart';
import 'package:invoice_app/src/core/domain/usecases/get_bank_info.dart';
import 'package:invoice_app/src/core/domain/usecases/get_client_info.dart';
import 'package:invoice_app/src/core/domain/usecases/get_company_address.dart';
import 'package:invoice_app/src/core/domain/usecases/get_company_name.dart';
import 'package:invoice_app/src/core/domain/usecases/get_service_info.dart';
import 'package:invoice_app/src/core/domain/usecases/save_invoice.dart';
import 'package:invoice_app/src/features/generate_pdf/domain/usecases/generate_invoice.dart';
import 'package:mobx/mobx.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io' show Platform;

part 'add_invoice_viewmodel.g.dart';

@injectable
class AddInvoiceViewModel extends _AddInvoiceViewModelBase
    with _$AddInvoiceViewModel {
  AddInvoiceViewModel(
    super.getBankInfo,
    super.getClientInfo,
    super.getCompanyAddress,
    super.getCompanyName,
    super.getServiceInfo,
    super._saveInvoice,
    super._generateInvoiceUseCase,
  );
}

abstract class _AddInvoiceViewModelBase with Store {
  final IGetBankInfo _getBankInfo;
  final IGetClientInfo _getClientInfo;
  final IGetCompanyAddress _getCompanyAddress;
  final IGetCompanyName _getCompanyName;
  final IGetServiceInfo _getServiceInfo;
  final ISaveInvoice _saveInvoice;
  final IGenerateInvoiceUseCase _generateInvoiceUseCase;

  _AddInvoiceViewModelBase(
    this._getBankInfo,
    this._getClientInfo,
    this._getCompanyAddress,
    this._getCompanyName,
    this._getServiceInfo,
    this._saveInvoice,
    this._generateInvoiceUseCase,
  );

  var idController = TextEditingController();
  var issueDateController = TextEditingController();
  var dueDateController = TextEditingController();

  Future<bool> saveInvoice() async {
    var bankInfo = _getBankInfo.get();
    var clientInfo = _getClientInfo.get();
    var companyAddress = _getCompanyAddress.get();
    var companyName = _getCompanyName.get();
    var serviceInfo = _getServiceInfo.get();

    if (bankInfo == null ||
        clientInfo == null ||
        companyAddress == null ||
        companyName == null ||
        serviceInfo == null) {
      //TODO: missing info treatment
      return false;
    }

    var invoice = HiveInvoice.newInvoice(
      int.parse(idController.text),
      issueDateController.text,
      dueDateController.text,
      serviceInfo,
      companyName,
      companyAddress,
      clientInfo,
      bankInfo,
    );

    await _saveInvoice.save(invoice);
    var pdf = await _generateInvoiceUseCase.createAndSavePDF(invoice);

    if (kDebugMode) {
      print(pdf.path);
    }

    if(Platform.isAndroid || Platform.isIOS) {
      await Share.shareXFiles([XFile(pdf.path)]);
    } else {
      //TODO: show dialog with save with success
    }

    return true;
  }
}
