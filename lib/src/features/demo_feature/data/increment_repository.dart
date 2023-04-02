import 'package:injectable/injectable.dart';

abstract class IIncrementRepository {
  int getIncrement();
}

@dev
@Injectable(as: IIncrementRepository)
class DevIncrementRepository implements IIncrementRepository {
  @override
  int getIncrement() => 2;
}

@prod
@Injectable(as: IIncrementRepository)
class ProdIncrementRepository implements IIncrementRepository {
  @override
  int getIncrement() => 1;
}
