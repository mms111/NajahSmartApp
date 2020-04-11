import 'package:flutter/material.dart';
import 'package:najah_smartapp/LoginSplash.dart';
import 'SplashScreen.dart';
import 'LoginPage.dart';
import 'LogoutSplash.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  routes: {
    'loginScreen' : (context) => LoginPage(),
    'loginSplashScreen' : (context) => LoginSplash(),
    'logoutSplashScreen' : (context) => LogoutSplash(),
  },
  title: 'Najah SmartApp',
  theme: ThemeData(
    primaryColor: Colors.green,
  ),
  home: SplashScreen(),
  ),
);


