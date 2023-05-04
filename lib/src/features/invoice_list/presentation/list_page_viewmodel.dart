import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/domain/usecases/get_invoice_list.dart';
import 'package:mobx/mobx.dart';

part 'list_page_viewmodel.g.dart';

@injectable
class ListPageViewModel extends _ListPageViewModelBase
    with _$ListPageViewModel {
  ListPageViewModel(super.getInvoiceList);
}

abstract class _ListPageViewModelBase with Store {
  final IGetInvoiceList getInvoiceList;

  _ListPageViewModelBase(this.getInvoiceList);
}