import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/data/repositories/client_repository.dart';
import 'package:invoice_app/src/features/settings/domain/models/client_info.dart';

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
