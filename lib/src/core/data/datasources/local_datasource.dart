import 'package:injectable/injectable.dart';

abstract class ILocalDataSource {
  String? getCompanyName();
  void saveCompanyName(String value);
}

@Injectable(as: ILocalDataSource)
class LocalDataSource implements ILocalDataSource {
  @override
  String? getCompanyName() => null;

  @override
  void saveCompanyName(String value) {
    // TODO: implement saveCompanyName
  }
}