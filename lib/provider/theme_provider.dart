import 'package:flutter/cupertino.dart';

import '../utils/shared_helper.dart';

class ThemeProvider with ChangeNotifier
{
  bool isLight = false;

  void changeTheme()
  async{
    ShareHelper shr= ShareHelper();
    bool? isTheme = await shr.getTheme();
    isLight = isTheme ?? false;
    notifyListeners();
  }
}