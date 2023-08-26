import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/domain/models/invoice.dart';
import 'package:invoice_app/src/domain/usecases/get_invoice_list.dart';
import 'package:invoice_app/src/domain/usecases/get_app_title.dart';
import 'package:mobx/mobx.dart';

part 'list_page_viewmodel.g.dart';

@injectable
class ListPageViewModel extends _ListPageViewModelBase
    with _$ListPageViewModel {
  ListPageViewModel(
    super._getInvoiceList,
    super._getAppTitle,
  );
}

abstract class _ListPageViewModelBase with Store {
  final IGetInvoiceList _getInvoiceList;
  final IGetAppTitle _getAppTitle;

  _ListPageViewModelBase(
    this._getInvoiceList,
    this._getAppTitle,
  ) {
    // Get initial value
    updateList(_getInvoiceList.get());
    _updateTitle(_getAppTitle.get());

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

  @action
  void _updateTitle(String? title) {
    if(title != null) {
      appTitle = title;
    }
  }

  void _observeChanges() {
    _getInvoiceList.observe().listen((event) {
      updateList(event);
    });

    _getAppTitle.observe().listen((event) {
      if(event != null) {
        _updateTitle(event);
      }
    });
  }
}
