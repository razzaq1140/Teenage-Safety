import 'package:flutter/material.dart';

class MemberShipProvider extends ChangeNotifier{
  int _selectedTabIndex = 0;

  int get selectedTabIndex => _selectedTabIndex;

  selectTabBarIndex(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }

  int _selectedPriceTabIndex = 0;

  int get selectedPriceTabIndex => _selectedPriceTabIndex;

  onTabSelectedPriceTabIndex(int index) {
    _selectedPriceTabIndex = index;
    notifyListeners();
  }
}
