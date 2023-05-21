import 'package:injectable/injectable.dart';
import 'package:invoice_app/src/core/data/datasources/local_datasource.dart';

abstract class IOnboardingRepository {
  bool hasFinishedOnboarding();

  Future<void> setOnboardingStatus(bool status);
}

@Singleton(as: IOnboardingRepository)
class OnboardingRepository implements IOnboardingRepository {
  final ILocalDataSource _source;

  OnboardingRepository(this._source);

  @override
  bool hasFinishedOnboarding() => _source.getOnboardingStatus();

  @override
  Future<void> setOnboardingStatus(bool status) =>
      _source.saveOnboardingStatus(status);
}
