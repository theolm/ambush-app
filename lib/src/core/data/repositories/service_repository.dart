import 'package:injectable/injectable.dart';

import '../datasources/local_datasource.dart';

abstract class IServiceRepository {

}

@Singleton(as: IServiceRepository)
class ServiceRepository implements IServiceRepository {
  final ILocalDataSource _source;

  ServiceRepository(this._source);

}
