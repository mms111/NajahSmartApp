
import 'package:flutter/material.dart';
import 'package:najah_smartapp/CustomWidgets/InputTextField.dart';
import 'package:najah_smartapp/CustomWidgets/AppLogo.dart';
import 'package:najah_smartapp/View/LoginSplashScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _loginFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: Center(
          child: Container(
            width: _width * 0.9,
            height: _height * 0.7,
            child: Form(
              key: _loginFormKey,
              child: ListView(
                
                children: <Widget>[

                  AppLogo(_height),

                  Padding(
                    padding: EdgeInsets.only(top: 45.0),
                    child: InputTextField(Icon(Icons.email, color: Colors.green,), "Email", _emailController, false),
                  ),

                  InputTextField(Icon(Icons.lock_open, color: Colors.green,), "Passwowrd", _passwordController, true),

                  Container(
                    height: _height * 0.1,
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: _height * 0.02,
                          decoration: TextDecoration.underline
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: ButtonTheme(
                        minWidth: _width * 0.35,
                        height: _height * 0.06,
                        child: RaisedButton(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: _height * 0.02,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          onPressed: () {
                            if(_loginFormKey.currentState.validate())
                            {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>LoginSplashScreen(
                                    _emailController.text, _passwordController.text
                                  )
                                )
                              );
                            }
                          }
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
  
}