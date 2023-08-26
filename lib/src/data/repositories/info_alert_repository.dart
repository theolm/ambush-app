import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/data/datasource/local_datasource.dart';

abstract class IInfoAlertRepository {
  bool getInfoAlertStatus();

  Future<void> saveInfoAlertStatus(bool value);
}

@Singleton(as: IInfoAlertRepository)
class InfoAlertRepository implements IInfoAlertRepository {
  final ILocalDataSource _source;

  InfoAlertRepository(this._source);

  @override
  bool getInfoAlertStatus() => _source.getInfoAlertStatus();

  @override
  Future<void> saveInfoAlertStatus(bool value) =>
      _source.saveInfoAlertStatus(value);
}
