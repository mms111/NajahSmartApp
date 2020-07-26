import 'package:flutter/material.dart';
import 'package:najah_smartapp/CustomWidgets/InputTextField.dart';
import 'package:najah_smartapp/Entity/Customer.dart';
import 'package:najah_smartapp/Presenter/CustomerPresenter.dart';

class CustomerTopUpScreen extends StatefulWidget {

  final Customer _customer;
  CustomerTopUpScreen(this._customer);

  @override
  _CustomerTopUpScreenState createState() => _CustomerTopUpScreenState();
}

class _CustomerTopUpScreenState extends State<CustomerTopUpScreen> {

  final _topUpFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();
  final _cvvController = TextEditingController();
  final _amountController = TextEditingController();

  DateTime _expDate;
  String _textHint ="Valid Till";

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
                    Icon(Icons.person, color: Colors.green,),
                    "Name on card", 
                    _nameController,
                    false,
                    TextInputType.text
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 25.0),
                    child: InputTextField(
                    Icon(Icons.credit_card, color: Colors.green,),
                    "Credit Card Number", 
                    _numberController,
                    false,
                    TextInputType.number
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Container(
                      width: _width*0.9,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                              color: Colors.green
                          )
                      ),

                      child: TextFormField(
                        readOnly: true,
                        textAlignVertical: TextAlignVertical(y: 0.1),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: _textHint,
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: _height * 0.02,
                          ),
                          prefixIcon: Icon(Icons.date_range, color: Colors.green,),
                          
                        ),
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime.now(),
                          ).then((date){
                            setState(() {
                              _expDate=date;
                              _textHint = _expDate.day.toString() + "/" +
                                  _expDate.month.toString() + "/" + _expDate.year.toString();
                            });
                          });
                          
                        },
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 25.0),
                    child: InputTextField(
                    Icon(Icons.confirmation_number, color: Colors.green,),
                    "CVV", 
                    _cvvController,
                    false,
                    TextInputType.number
                    ),
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
                              CustomerPresenter().topUp(context, widget._customer, double.parse(_amountController.text));
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