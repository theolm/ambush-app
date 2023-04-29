import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'basic_info_viewmodel.g.dart';

@injectable
class BasicInfoViewModel extends _BasicInfoViewModelBase
    with _$BasicInfoViewModel {
  BasicInfoViewModel();
}

abstract class _BasicInfoViewModelBase with Store {

}
