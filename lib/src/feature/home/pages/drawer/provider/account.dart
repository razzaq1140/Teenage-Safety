import 'package:flutter/cupertino.dart';

class AccountProvider extends ChangeNotifier{
  bool _visibility = true;
  bool _visibility2 = true;
  bool get visibility => _visibility;
  bool get visibility2 => _visibility2;

  onChangeVisibility(){
    _visibility =! _visibility;
    notifyListeners();
  }

  onChangeVisibility2(){
    _visibility2 =! _visibility2;
    notifyListeners();
  }
}