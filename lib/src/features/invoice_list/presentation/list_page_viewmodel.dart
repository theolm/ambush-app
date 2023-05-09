import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/data/models/hive_invoice.dart';
import 'package:invoice_app/src/core/domain/usecases/get_invoice_list.dart';
import 'package:mobx/mobx.dart';

part 'list_page_viewmodel.g.dart';

@injectable
class ListPageViewModel extends _ListPageViewModelBase
    with _$ListPageViewModel {
  ListPageViewModel(super.getInvoiceList);
}

abstract class _ListPageViewModelBase with Store {
  final IGetInvoiceList _getInvoiceList;

  _ListPageViewModelBase(this._getInvoiceList) {
    // Get initial value
    invoiceList = _getInvoiceList.get();

    // Observe for changes
    _getInvoiceList.observe().listen((event) {
      updateList(event);
    });
  }

  @observable
  List<HiveInvoice> invoiceList = [];

  @action
  void updateList(List<HiveInvoice> list) {
    invoiceList = list;
  }
}
