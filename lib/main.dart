import 'package:flutter/material.dart';
import 'package:najah_smartapp/View/HomeScreen.dart';
import 'View/SplashScreen.dart';
import 'View/LoginScreen.dart';
import 'View/LogoutSplashScreen.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  routes: {
    '/home' : (context) => HomeScreen(),
    '/loginScreen' : (context) => LoginScreen(),
    '/logoutSplashScreen' : (context) => LogoutSplashScreen(),
  },
  title: 'Najah SmartApp',
  theme: ThemeData(
    primaryColor: Colors.green,
  ),
  home: SplashScreen(),
  ),
);


