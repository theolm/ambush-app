import 'package:ambush_app/src/presentation/utils/share_file.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'backup_viewmodel.g.dart';

@injectable
class BackupViewModel extends _BackupViewModelBase with _$BackupViewModel {
  BackupViewModel(super._shareFile);
}

abstract class _BackupViewModelBase with Store {
  final IShareFile _shareFile;

  _BackupViewModelBase(this._shareFile);

  Future createBackup() async {
    _shareFile.shareBackup();
  }
}
