import 'package:flutter/material.dart';
import 'package:najah_smartapp/AppBottomNavigationBar.dart';
import 'AppTextField.dart';
import 'AppLogo.dart';
import 'Customer.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  BuildContext _context;

  @override
  Widget build(BuildContext context) {

    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    _context = context;

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
                    child: AppTextField(Icon(Icons.email, color: Colors.green,), "Email", emailController, false),
                  ),

                  AppTextField(Icon(Icons.lock_open, color: Colors.green,), "Passwowrd", passwordController, true),

                  Container(
                    height: _height * 0.1,
                    alignment: Alignment.center,
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: _height * 0.02,
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
                          onPressed: submit,
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

  submit()
  {
    
    if(_loginFormKey.currentState.validate())
    {
      if(emailController.text == Customer().email && passwordController.text == Customer().password)
      {
        Navigator.of(context).pushNamedAndRemoveUntil(
          'loginSplashScreen',
          (Route<dynamic> route) => false,
        );
      }
      else
      {
        return showDialog(
          context: _context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
          title: Text("Can't find account"),
          content: Text("incorrect email or password"),
          actions: <Widget>[
            Container(
              alignment: Alignment.center,
              child: FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: Colors.green,
              ),
            )
          ],
          backgroundColor: Colors.blueGrey[50],
        )
        );
      }
      
    }
  }
}