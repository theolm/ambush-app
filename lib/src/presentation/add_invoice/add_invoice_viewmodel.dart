import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:invoice_app/src/domain/models/bank_info.dart';
import 'package:invoice_app/src/domain/models/client_info.dart';
import 'package:invoice_app/src/domain/models/comp_info.dart';
import 'package:invoice_app/src/domain/models/invoice.dart';
import 'package:invoice_app/src/domain/models/service_info.dart';
import 'package:invoice_app/src/domain/usecases/get_next_id.dart';
import 'package:invoice_app/src/domain/usecases/save_invoice.dart';
import 'package:invoice_app/src/domain/usecases/generate_invoice.dart';
import 'package:mobx/mobx.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io' show Platform;

part 'add_invoice_viewmodel.g.dart';

@injectable
class AddInvoiceViewModel extends _AddInvoiceViewModelBase
    with _$AddInvoiceViewModel {
  AddInvoiceViewModel(
    super._saveInvoice,
    super._generateInvoiceUseCase,
    super._getNextId,
  );
}

abstract class _AddInvoiceViewModelBase with Store {
  final ISaveInvoice _saveInvoice;
  final IGenerateInvoiceUseCase _generateInvoiceUseCase;
  final IGetNextId _getNextId;

  _AddInvoiceViewModelBase(
    this._saveInvoice,
    this._generateInvoiceUseCase,
    this._getNextId,
  ) {
    var nextId = _getNextId.get();
    if (nextId != null) {
      idController.text = nextId.toString();
    }
  }

  final formKey = GlobalKey<FormState>();
  final idController = TextEditingController();
  final issueDateController = TextEditingController();
  final dueDateController = TextEditingController();

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

  bool validateForm() => formKey.currentState!.validate();

  Invoice? getInvoice(
    ServiceInfo serviceInfo,
    CompanyInfo companyInfo,
    ClientInfo clientInfo,
    BankInfo bankInfo,
  ) {
    if (!_validateDates()) {
      return null;
    }

    var now = DateTime.now();
    return Invoice(
      int.parse(idController.text),
      _issueDate!.millisecondsSinceEpoch,
      _dueDate!.millisecondsSinceEpoch,
      serviceInfo,
      companyInfo,
      clientInfo,
      bankInfo,
      now.millisecondsSinceEpoch,
      now.millisecondsSinceEpoch,
    );
  }

  Future<bool> saveInvoice(Invoice invoice) async {
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
