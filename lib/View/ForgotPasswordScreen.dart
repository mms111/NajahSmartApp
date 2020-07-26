
import 'package:flutter/material.dart';
import 'package:najah_smartapp/CustomWidgets/AppLogo.dart';
import 'package:najah_smartapp/CustomWidgets/InputTextField.dart';
import 'package:najah_smartapp/Presenter/LoginPresenter.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _forgotPasswordFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

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
              key: _forgotPasswordFormKey,
              child: ListView(
                
                children: <Widget>[

                  AppLogo(_height),

                  Padding(
                    padding: EdgeInsets.only(top: 45.0),
                    child: InputTextField(
                      Icon(Icons.email, color: Colors.green,), 
                      "Email", 
                      _emailController, 
                      false,
                      TextInputType.text,
                    ),
                  ),

              
                  Padding(
                    padding: EdgeInsets.only(top: 35.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: ButtonTheme(
                        minWidth: _width * 0.35,
                        height: _height * 0.06,
                        child: RaisedButton(
                          child: Text(
                            "Send Email",
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
                            if(_forgotPasswordFormKey.currentState.validate())
                            {
                              LoginPresenter().resetPassword(context, _emailController.text);
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