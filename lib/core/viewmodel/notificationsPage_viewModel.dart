import 'package:stacked/stacked.dart';
import 'package:timely/core/services/services.dart';

class NotificationsPageViewModel extends BaseViewModel {
  Services services = Services();
  String notificationMessageTitle = Services().messageTitle;
  String notificationAlert = Services().notificationAlert;
}
