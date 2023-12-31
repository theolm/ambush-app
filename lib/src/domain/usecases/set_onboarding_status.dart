import 'package:injectable/injectable.dart';
import 'package:ambush_app/src/data/repositories/onboarding_repository.dart';

abstract class ISetOnboardingStatus {
  Future<void> set(bool status);
}

@Injectable(as: ISetOnboardingStatus)
class SetOnboardingStatus implements ISetOnboardingStatus {
  final IOnboardingRepository _repo;

  SetOnboardingStatus(this._repo);

  @override
  Future<void> set(bool status) => _repo.setOnboardingStatus(status);
}
