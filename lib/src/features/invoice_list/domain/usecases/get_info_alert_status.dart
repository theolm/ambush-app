import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/features/invoice_list/data/repositories/info_alert_repository.dart';

abstract class IGetInfoAlertStatus {
  bool get();
}

@Injectable(as: IGetInfoAlertStatus)
class GetInfoAlertStatus implements IGetInfoAlertStatus {
  final IInfoAlertRepository _repository;

  GetInfoAlertStatus(this._repository);

  @override
  bool get() => _repository.getInfoAlertStatus();
}
