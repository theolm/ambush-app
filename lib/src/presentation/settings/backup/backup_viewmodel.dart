import 'package:ambush_app/src/domain/usecases/restore_backup_file.dart';
import 'package:ambush_app/src/presentation/utils/share_file.dart';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'backup_viewmodel.g.dart';

@injectable
class BackupViewModel extends _BackupViewModelBase with _$BackupViewModel {
  BackupViewModel(super._shareFile, super._restoreBackupFile);
}

abstract class _BackupViewModelBase with Store {
  final IShareFile _shareFile;
  final IRestoreBackupFile _restoreBackupFile;

  _BackupViewModelBase(this._shareFile, this._restoreBackupFile);

  Future createBackup() async {
    _shareFile.shareBackup();
  }

  Future restoreBackup() async {
    final filePicker = await FilePicker.platform.pickFiles(
      type: FileType.any,
      withData: true,
    );

    try {
      final file = filePicker!.files.first;
      await _restoreBackupFile.restore(file.bytes!);
    } catch (e) {
      //TODO: show error
      print(e);
    }
  }
}
