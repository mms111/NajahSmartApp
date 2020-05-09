import 'package:flutter/material.dart';
import 'package:najah_smartapp/CustomWidgets/InputTextField.dart';
import 'package:najah_smartapp/Presenter/AdminPresenter.dart';

class TopUpScreen extends StatefulWidget {
  @override
  _TopUpScreenState createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {

  final _topUpFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _amountController = TextEditingController();

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
            "Top-up"
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Form(
            key: _topUpFormKey,
            child: Container(
              width: _width*0.9,
              child: ListView(
                children: <Widget>[
                  
                  SizedBox(
                    height: _height * 0.15,
                  ),

                  InputTextField(
                    Icon(Icons.email, color: Colors.green,),
                    "Email", 
                    _emailController,
                    false,
                    TextInputType.text
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 25.0),
                    child: InputTextField(
                    Icon(Icons.attach_money, color: Colors.green,),
                    "Amount", 
                    _amountController,
                    false,
                    TextInputType.number
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
                            "Top-up",
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
                            if(_topUpFormKey.currentState.validate())
                            {
                              AdminPresenter().topUp(
                                context, 
                                _emailController.text, 
                                double.parse(_amountController.text)
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