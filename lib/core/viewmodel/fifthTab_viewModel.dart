import 'package:stacked/stacked.dart';
import 'package:timely/core/services/services.dart';

class FifthTabViewModel extends BaseViewModel {
  Services services = Services();
  String _photoURL;
  String _email;
  String _displayName;
  get photoURL => _photoURL;
  get email => _email;
  get displayName => _displayName;
  initialize() {
    _photoURL = services.auth.currentUser.photoURL;
    _email = services.auth.currentUser.email;
    _displayName = services.auth.currentUser.displayName;
  }
}
