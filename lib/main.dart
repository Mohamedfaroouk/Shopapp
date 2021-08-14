import 'dart:async';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:myshop/layout/splashscreen.dart';
import 'package:myshop/providers/main_provider.dart';
import 'package:myshop/shared/remote/dio_helper.dart';
import 'package:myshop/login/test.dart';
import 'package:provider/provider.dart';

import 'layout/homepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  diohelp.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
              value: MainProvider()
                ..getcartdata()
                ..getdata())
        ],
        child: FutureBuilder(
            future: Future.delayed(const Duration(seconds: 3)),
            builder: (context, snapshot) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(
                  appBarTheme: const AppBarTheme(
                      iconTheme: const IconThemeData(color: Colors.black)),
                  primaryColor: Colors.white,
                  primarySwatch: Colors.blue,
                ),
                home: snapshot.connectionState == ConnectionState.waiting
                    ? const SplashScreen()
                    : LoginScreen(),
              );
            }));
  }
}
