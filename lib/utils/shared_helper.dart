import 'package:shared_preferences/shared_preferences.dart';

class ShareHelper {
  void setIntroStatus() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setBool("intro", true);
  }

  Future<bool?> getIntroStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     bool? status = sharedPreferences.getBool("intro");
     return status;
  }

  void setTheme(bool isTheme) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setBool('theme', isTheme);
  }

  Future<bool?> getTheme() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    bool? isTheme = await shr.getBool('theme');
    return isTheme;
  }


  void setRegister(String email, String password)async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setString("email",email);
    shr.setString("password",password);
  }
  Future<Map>getEmailPassword()async{
    SharedPreferences shr = await SharedPreferences.getInstance();
    String? email= shr.getString("email");
    String? password= shr.getString("password");
    return {"email":email,"password":password};
  }
  Future<void> setLoginLogout(bool isLogin)async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setBool("login", isLogin);
  }
  Future<bool?> getLoginStatus()async{
    SharedPreferences shr = await SharedPreferences.getInstance();
    return shr.getBool("login");
  }
}
