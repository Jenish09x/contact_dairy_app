import 'package:flutter/cupertino.dart';

class ThemeProvider with ChangeNotifier{

  bool isLight = true;

  void changeThem()
  {
    isLight = !isLight;
    notifyListeners();
  }
}