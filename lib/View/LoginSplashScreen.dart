import 'package:flutter/material.dart';
import 'package:najah_smartapp/Presenter/LoginPresenter.dart';

class LoginSplashScreen extends StatefulWidget {
  final String _email;
  final String _password;
  LoginSplashScreen(this._email, this._password);
  @override
  _LoginSplashScreenState createState() => _LoginSplashScreenState();
}

class _LoginSplashScreenState extends State<LoginSplashScreen> {
  final LoginPresenter loginPresenter = new LoginPresenter();

  @override
  void initState(){

    super.initState();
    new Future.delayed(
        const Duration(seconds: 2),
        () => loginPresenter.validateUser(context, widget._email, widget._password));
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