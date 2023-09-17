import 'package:injectable/injectable.dart';
import 'package:ambush_app/src/data/repositories/client_repository.dart';
import 'package:ambush_app/src/domain/models/client_info.dart';

abstract class ISaveClientInfo {
  Future<void> save(ClientInfo value);
}

@Injectable(as: ISaveClientInfo)
class SaveClientInfo implements ISaveClientInfo {
  final IClientRepository _repository;

  SaveClientInfo(this._repository);

  @override
  Future<void> save(ClientInfo value) => _repository.saveClientInfo(value);
}
