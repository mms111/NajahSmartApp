import 'package:flutter/material.dart';
import 'package:najah_smartapp/View/HomeScreen.dart';
import 'View/SplashScreen.dart';
import 'View/LoginScreen.dart';
import 'View/LogoutSplashScreen.dart';
import 'View/ForgotPasswordScreen.dart';
import 'View/SignupScreen.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  routes: {
    '/home' : (context) => HomeScreen(),
    '/loginScreen' : (context) => LoginScreen(),
    '/logoutSplashScreen' : (context) => LogoutSplashScreen(),
    '/forgotPasswordScreen' : (context) => ForgotPasswordScreen(),
    '/signUpScreen' : (context) => SignUpScreen(),
  },
  title: 'Najah SmartApp',
  theme: ThemeData(
    primarySwatch: Colors.green,
    primaryColor: Colors.green,
  ),
  home:SplashScreen(),
  ),
);


