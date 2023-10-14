import 'package:ambush_app/src/data/repositories/client_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:ambush_app/src/domain/models/client_info.dart';

abstract class IGetClientInfo {
  ClientInfo get();
}

@Injectable(as: IGetClientInfo)
class GetClientInfo implements IGetClientInfo {
  final IClientRepository _repository;

  GetClientInfo(this._repository);

  @override
  ClientInfo get() => _repository.getClientInfo();
}
