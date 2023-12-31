import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'backup_viewmodel.g.dart';

@injectable
class BackupViewModel extends _BackupViewModelBase
    with _$BackupViewModel {
  BackupViewModel();
}

abstract class _BackupViewModelBase with Store {

}
