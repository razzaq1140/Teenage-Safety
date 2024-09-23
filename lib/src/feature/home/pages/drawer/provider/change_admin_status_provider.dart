import 'package:flutter/cupertino.dart';

class ChangeAdminStatusProvider extends ChangeNotifier{
  bool _isSwitch = true;
  bool get isSwitch => _isSwitch;

  onChange(value){
    _isSwitch = value;
    notifyListeners();
  }

  bool _visibility = true;
  bool get visibility => _visibility;

  onChangeVisibility(value){
    _visibility = value;
    notifyListeners();
  }
}