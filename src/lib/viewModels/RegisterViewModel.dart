import 'package:flutter/cupertino.dart';

class RegisterViewModel extends ChangeNotifier{
  String username = "";
  String password = "";

  void registerUser(){
    notifyListeners();
  }
}