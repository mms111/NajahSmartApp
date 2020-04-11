import 'package:flutter/material.dart';
import 'AppBottomNavigationBar.dart';

class LoginSplash extends StatefulWidget {
  @override
  _LoginSplashState createState() => _LoginSplashState();
}

class _LoginSplashState extends State<LoginSplash> {


  @override
  void initState(){

    super.initState();
    new Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) =>AppBottomNavigationBar()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: Container(
          child: Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                strokeWidth: 7.0,
              ),
          )
        ),
      ),
    );
  }
}