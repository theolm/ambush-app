import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/data/repositories/client_repository.dart';
import 'package:invoice_app/src/core/domain/data_models/client_info.dart';

abstract class IGetClientInfo {
  ClientInfo? get();
}

@Injectable(as: IGetClientInfo)
class GetClientInfo implements IGetClientInfo {
  final IClientRepository _repository;

  GetClientInfo(this._repository);

  @override
  ClientInfo? get() => _repository.getClientInfo();
}
