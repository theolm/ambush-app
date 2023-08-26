import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/data/repositories/service_repository.dart';
import 'package:invoice_app/src/domain/models/service_info.dart';

abstract class ISaveServiceInfo {
  Future<void> save(ServiceInfo value);
}

@Injectable(as: ISaveServiceInfo)
class SaveServiceInfo implements ISaveServiceInfo {
  final IServiceRepository _repository;

  SaveServiceInfo(this._repository);

  @override
  Future<void> save(ServiceInfo value) =>
      _repository.saveServiceInfo(value);

}
