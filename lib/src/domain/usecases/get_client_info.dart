import 'package:ambush_app/src/domain/models/ambush_info.dart';
import 'package:injectable/injectable.dart';
import 'package:ambush_app/src/domain/models/client_info.dart';

abstract class IGetClientInfo {
  ClientInfo? get();
}

@Injectable(as: IGetClientInfo)
class GetClientInfo implements IGetClientInfo {
  @override
  ClientInfo? get() => ClientInfo(ambushName, ambushAddress);
}
