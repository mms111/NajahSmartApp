import 'package:flutter/material.dart';
import 'package:najah_smartapp/Presenter/LoginPresenter.dart';

class SignUpSplashScreen extends StatefulWidget {
  final String _name;
  final String _email;
  final String _password;
  final String _phone;
  SignUpSplashScreen(this._name,this._email, this._password,this._phone);
  @override
  _SignUpSplashScreenState createState() => _SignUpSplashScreenState();
}

class _SignUpSplashScreenState extends State<SignUpSplashScreen> {
  final LoginPresenter loginPresenter = new LoginPresenter();

  @override
  void initState(){

    super.initState();
    new Future.delayed(
        const Duration(seconds: 2),
        () => loginPresenter.addUser(context, widget._name, widget._email, widget._password, widget._phone));
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