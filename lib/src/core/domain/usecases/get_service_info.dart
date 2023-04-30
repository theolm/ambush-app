import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/data/repositories/service_repository.dart';
import 'package:invoice_app/src/features/settings/domain/models/service_info.dart';

abstract class IGetServiceInfo {
  ServiceInfo? get();
}

@Injectable(as: IGetServiceInfo)
class GetServiceInfo implements IGetServiceInfo {
  final IServiceRepository _repository;

  GetServiceInfo(this._repository);

  @override
  ServiceInfo? get() => _repository.getServiceInfo();
}
