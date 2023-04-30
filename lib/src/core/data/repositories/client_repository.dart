import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/data/models/hive_client_info.dart';
import 'package:invoice_app/src/features/settings/domain/models/client_info.dart';

import '../datasources/local_datasource.dart';

abstract class IClientRepository {
  ClientInfo? getClientInfo();
  Future<void> saveClientInfo(ClientInfo value);
}

@Singleton(as: IClientRepository)
class ClientRepository implements IClientRepository {
  final ILocalDataSource _source;

  ClientRepository(this._source);

  @override
  ClientInfo? getClientInfo() => _source.getClientInfo()?.toClientInfo();

  @override
  Future<void> saveClientInfo(ClientInfo value) =>
      _source.saveClientInfo(HiveClientInfo.from(value));

}
