import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../domain/usecase/set_onboarding_status.dart';

part 'onboarding_viewmodel.g.dart';

@injectable
class OnboardingViewModel extends _OnboardingViewModelBase
    with _$OnboardingViewModel {
  OnboardingViewModel(super.setOnboardingStatus);
}

abstract class _OnboardingViewModelBase with Store {
  final ISetOnboardingStatus setOnboardingStatus;

  _OnboardingViewModelBase(this.setOnboardingStatus);

  Future<void> finishOnboarding() async {
    await setOnboardingStatus.set(true);
  }
}