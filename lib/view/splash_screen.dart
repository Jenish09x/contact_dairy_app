import 'package:contact_dairy_app/utils/shared_helper.dart';
import 'package:flutter/material.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({super.key});

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  bool? status;
  bool? isLogin;

  @override
  void initState() {
    super.initState();
    checkStatus();
    createData();
  }

  void checkStatus() async {
    ShareHelper shr = ShareHelper();
    status = await shr.getIntroStatus();
  }
  Future<void> createData()async{
    ShareHelper shr = ShareHelper();
    isLogin = await shr.getLoginStatus();
  }
  // context,status==false || status==null?'introScreen':'home',
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, isLogin==false || isLogin==null ?'login':'home'),
    );
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Image(image: AssetImage("assets/header/splash.png"),height: 200,),
        ),
      ),
    );
  }
}
