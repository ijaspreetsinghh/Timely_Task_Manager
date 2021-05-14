import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class OnBoardingViewModel extends BaseViewModel {
  PageController pageController = PageController();
  int currentPage = 0;

  circleButtonPressed() {
    notifyListeners();
    moveToNextPage();
    notifyListeners();
  }

  pageChanged() {
    currentPage = pageController.page.toInt();
    notifyListeners();
    pageController.nextPage(
        duration: Duration(milliseconds: 700), curve: Curves.ease);
  }

  moveToNextPage() {
    pageController.nextPage(
        duration: Duration(milliseconds: 1000), curve: Curves.ease);
  }

  skipOnBoarding() {
    pageController.animateToPage(2,
        duration: Duration(milliseconds: 1000), curve: Curves.ease);
  }

  moveToPreviousPage() {
    pageController.previousPage(
        duration: Duration(milliseconds: 700), curve: Curves.ease);
  }

  pageChanger(page) {
    currentPage = page;
    notifyListeners();
  }
}
