import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/features/onboarding/data/repository/onboarding_repository.dart';

abstract class IFinishedOnboarding {
  bool get();
}

@Injectable(as: IFinishedOnboarding)
class FinishedOnboarding implements IFinishedOnboarding {
  final IOnboardingRepository _repo;

  FinishedOnboarding(this._repo);

  @override
  bool get() => _repo.hasFinishedOnboarding();
}
