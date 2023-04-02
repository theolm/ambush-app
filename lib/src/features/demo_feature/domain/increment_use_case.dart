import 'package:injectable/injectable.dart';
import 'package:template_flutter/src/features/demo_feature/data/increment_repository.dart';

abstract class IIncrementUseCase {
  int increment(int current);
}

@Injectable(as: IIncrementUseCase)
class IncrementUseCase implements IIncrementUseCase {
  final IIncrementRepository repository;

  IncrementUseCase(this.repository);

  @override
  int increment(int current) => current + repository.getIncrement();
}
