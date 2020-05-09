import 'package:flutter/material.dart';
import 'package:najah_smartapp/CustomWidgets/InputTextField.dart';
import 'package:najah_smartapp/Presenter/AdminPresenter.dart';

class AddPackageScreen extends StatelessWidget {

   final _addPackageFormKey = GlobalKey<FormState>();
   final _titleController = TextEditingController();
   final _validityController = TextEditingController();
   final _priceController = TextEditingController();
    
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
            "Add Package"
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Form(
            key: _addPackageFormKey,
            child: Container(
              width: _width*0.9,
              child: ListView(
                children: <Widget>[
                  
                  SizedBox(
                    height: _height * 0.15,
                  ),

                  InputTextField(
                    Icon(Icons.title, color: Colors.green,),
                    "Title", 
                    _titleController,
                    false,
                    TextInputType.text
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 25.0),
                    child: InputTextField(
                    Icon(Icons.card_membership, color: Colors.green,),
                    "Validity", 
                    _validityController,
                    false,
                    TextInputType.text
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 25.0),
                    child: InputTextField(
                    Icon(Icons.attach_money, color: Colors.green,),
                    "Price", 
                    _priceController,
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
                            "Add",
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
                            if(_addPackageFormKey.currentState.validate())
                            {
                              AdminPresenter().addPackage(
                                context, 
                                _titleController.text,
                                _validityController.text,
                                double.parse(_priceController.text),
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