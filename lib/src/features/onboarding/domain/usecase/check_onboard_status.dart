import 'package:injectable/injectable.dart';

abstract class ICheckOnboardingStatus {
  bool get();
}

@Injectable(as: ICheckOnboardingStatus)
class CheckOnboardingStatus implements ICheckOnboardingStatus {
  @override
  bool get() {
    return true;
  }

}
