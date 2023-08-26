import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/data/repositories/info_alert_repository.dart';

abstract class ISaveInfoAlertStatus {
  Future save(bool value);
}

@Injectable(as: ISaveInfoAlertStatus)
class SaveInfoAlertStatus implements ISaveInfoAlertStatus {
  final IInfoAlertRepository _repository;

  SaveInfoAlertStatus(this._repository);

  @override
  Future save(bool value) => _repository.saveInfoAlertStatus(value);
}
