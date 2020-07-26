import 'package:flutter/material.dart';
import 'package:najah_smartapp/CustomWidgets/InputTextField.dart';
import 'package:najah_smartapp/View/SignUpSplashScreen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _addUserFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            "Sign Up"
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Form(
            key: _addUserFormKey,
            child: Container(
              width: _width * 0.9,
              child: ListView(
                children: <Widget>[

                  SizedBox(
                    height: _height * 0.15,
                  ),

                  InputTextField(
                    Icon(Icons.person, color: Colors.green,),
                    "Name",
                    _nameController,
                    false,
                    TextInputType.text
                  ),

                  Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      child: InputTextField(
                        Icon(Icons.email, color: Colors.green,),
                        "Email", 
                        _emailController, 
                        false,
                        TextInputType.text
                      ),
                  ),

                  Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      child: InputTextField(
                        Icon(Icons.lock_outline, color: Colors.green,), 
                        "Password", 
                        _passwordController, 
                        true,
                        TextInputType.text,
                      ),
                  ),

                  Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      child: InputTextField(
                        Icon(Icons.phone, color: Colors.green,),
                        "Phone No", 
                        _phoneController, 
                        false,
                        TextInputType.number,
                      ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 40.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: ButtonTheme(
                        minWidth: _width * 0.35,
                        height: _height * 0.06,
                        child: RaisedButton(
                          child: Text(
                            "Sign Up",
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
                            if(_addUserFormKey.currentState.validate())
                            {
                              
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SignUpSplashScreen(
                                    _nameController.text, _emailController.text, 
                                    _passwordController.text, _phoneController.text
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
        ),
      ),
    );
  }
}