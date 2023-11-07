import 'package:contact_dairy_app/provider/contact_provider.dart';
import 'package:contact_dairy_app/utils/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ContactProvider(),
      child: Consumer<ContactProvider>(
        builder: (context, value, child) => MaterialApp(
          theme: ThemeData(useMaterial3: true),
          debugShowCheckedModeBanner: false,
          routes: screen_routes,
        ),
      ),
    ),
  );
}
