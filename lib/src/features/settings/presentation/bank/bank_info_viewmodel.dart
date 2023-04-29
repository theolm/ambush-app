import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'bank_info_viewmodel.g.dart';

@injectable
class BankInfoViewModel extends _BankInfoViewModelBase
    with _$BankInfoViewModel {
  BankInfoViewModel();
}

abstract class _BankInfoViewModelBase with Store {

}
