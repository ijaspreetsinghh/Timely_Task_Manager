import 'package:stacked/stacked.dart';

class PageDeciderViewModel extends BaseViewModel {
  int _selectedIndex = 0;
  get selectedIndex => _selectedIndex;
  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
