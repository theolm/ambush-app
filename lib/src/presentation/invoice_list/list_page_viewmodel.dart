import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/domain/models/invoice.dart';
import 'package:invoice_app/src/domain/usecases/get_invoice_list.dart';
import 'package:mobx/mobx.dart';

part 'list_page_viewmodel.g.dart';

@injectable
class ListPageViewModel extends _ListPageViewModelBase
    with _$ListPageViewModel {
  ListPageViewModel(super._getInvoiceList);
}

abstract class _ListPageViewModelBase with Store {
  final IGetInvoiceList _getInvoiceList;

  _ListPageViewModelBase(
    this._getInvoiceList,
  ) {
    // Get initial value
    updateList(_getInvoiceList.get());

    // Observe for changes
    _observeChanges();
  }

  bool canShowInfoAlert = false;

  @observable
  ObservableList<Invoice> invoiceList = ObservableList();

  @observable
  String appTitle = '';

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
}
