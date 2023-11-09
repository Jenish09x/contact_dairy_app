import 'package:contact_dairy_app/view/contact_info_screen.dart';
import 'package:flutter/material.dart';
import '../view/add_contact_screen.dart';
import '../view/hide_contact_screen.dart';
import '../view/contact_screen.dart';
import '../view/intro_screen.dart';
import '../view/login_screen.dart';
import '../view/register_screen.dart';
import '../view/splash_screen.dart';

Map<String,WidgetBuilder>screen_routes={

  '/':(context) => const SpleshScreen(),
  'introScreen':(context) => const IntroScreen(),
  'login':(context) => const LoginScreen(),
  'register':(context) => const RegisterScreen(),
  'home':(context) => const ContactScreen(),
  'contact':(context) => const AddContactScreen(),
  'contactInfo':(context) => const ContactInfoScreen(),
  'hideScreen':(context) => const HideContactScreen()
};