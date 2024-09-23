import 'package:flutter/cupertino.dart';

class WatchOverProvider extends ChangeNotifier{

  bool _watchOver = true;
  bool get watchOver  => _watchOver;

  onChangeWatch(bool value){
    _watchOver = value;
    notifyListeners();
  }

  bool _sendingAlert = true;
  bool get sendingAlert  => _sendingAlert;

  onChangeSending(bool value){
    _sendingAlert = value;
    notifyListeners();
  }
}