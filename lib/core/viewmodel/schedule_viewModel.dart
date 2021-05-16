import 'package:stacked/stacked.dart';
import 'package:timely/core/services/services.dart';

class ScheduleViewModel extends BaseViewModel {
  Services services = Services();
  String _displayName;
  get displayName => _displayName;
  initiate() {
    _displayName = services.auth.currentUser.displayName;
  }
}
