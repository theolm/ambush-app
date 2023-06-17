import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/domain/data_models/invoice.dart';
import 'package:invoice_app/src/core/domain/usecases/get_invoice_list.dart';
import 'package:invoice_app/src/core/domain/usecases/validate_invoice_settings.dart';
import 'package:invoice_app/src/features/invoice_list/domain/usecases/get_info_alert_status.dart';
import 'package:mobx/mobx.dart';

part 'list_page_viewmodel.g.dart';

@injectable
class ListPageViewModel extends _ListPageViewModelBase
    with _$ListPageViewModel {
  ListPageViewModel(
    super._getInvoiceList,
    super._validateInvoiceSettings,
    super._getInfoAlertStatus,
  );
}

abstract class _ListPageViewModelBase with Store {
  final IGetInvoiceList _getInvoiceList;
  final IValidateInvoiceSettings _validateInvoiceSettings;
  final IGetInfoAlertStatus _getInfoAlertStatus;

  _ListPageViewModelBase(
    this._getInvoiceList,
    this._validateInvoiceSettings,
    this._getInfoAlertStatus,
  ) {
    // Get initial value
    updateList(_getInvoiceList.get());

    canShowInfoAlert =
        _validateInvoiceSettings.validate() != InvoiceSettingsStatus.ok &&
            !_getInfoAlertStatus.get();

    // Observe for changes
    _observeChanges();
  }

  bool canShowInfoAlert = false;

  @observable
  ObservableList<Invoice> invoiceList = ObservableList();

  @action
  void updateList(List<Invoice> list) {
    invoiceList.clear();
    invoiceList
        .addAll(list..sort((a, b) => -a.createdAt.compareTo(b.createdAt)));
  }

  void _observeChanges() {
    _getInvoiceList.observe().listen((event) {
      updateList(event);
    });
  }

  void onInfoAlertShow() {
    //TODO: is this a single event? if it is need to call SaveInfoAlertStatus
    canShowInfoAlert = false;
  }

  InvoiceSettingsStatus validateSettings() =>
      _validateInvoiceSettings.validate();
}
