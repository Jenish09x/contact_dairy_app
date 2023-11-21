import 'package:contact_dairy_app/provider/contact_provider.dart';
import 'package:contact_dairy_app/utils/app_routes.dart';
import 'package:contact_dairy_app/utils/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/theme_provider.dart';

void main() {
  runApp(

      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ThemeProvider(),
          ),
          ChangeNotifierProvider(
          create: (context) => ContactProvider(),
          ),
        ],
        child: Consumer<ThemeProvider>(
          builder: (context, value, child)
        {
          value.changeTheme();
           return  MaterialApp(
             theme: value.isLight ? lightTheme : darkTheme,
             debugShowCheckedModeBanner: false,
             routes: screen_routes,
           );
      }),
      ),
  );
}
