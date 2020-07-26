import 'dart:io';
import 'package:flutter/material.dart';
import 'package:najah_smartapp/Entity/Customer.dart';
import 'package:najah_smartapp/Presenter/CustomerPresenter.dart';

class EditProfileSplashScreen extends StatefulWidget {
  
  final File _image;
  final Customer _customer;
  final String _name;
  final String _phone;
  EditProfileSplashScreen(this._image, this._customer, this._name, this._phone);

  @override
  _EditProfileSplashScreenState createState() => _EditProfileSplashScreenState();
}

class _EditProfileSplashScreenState extends State<EditProfileSplashScreen> {

  
  @override
  void initState(){

    CustomerPresenter customerPresenter = CustomerPresenter();
    customerPresenter.setCustomer(widget._customer);

    super.initState();
    if(widget._image!=null && 
      widget._name == widget._customer.name && 
      widget._phone == widget._customer.phone)
      {
        new Future.delayed(
        const Duration(seconds: 2),
        () => customerPresenter.updateImage(context, widget._image));
        
      }

      else if(widget._image==null &&  
              (widget._name != widget._customer.name || 
              widget._phone != widget._customer.phone))
      {
         new Future.delayed(
        const Duration(seconds: 2),
        () => customerPresenter.updateDetails(context, widget._name, widget._phone));
        
      }

      else if(widget._image!=null &&  
              (widget._name != widget._customer.name || 
              widget._phone != widget._customer.phone))
      {
        new Future.delayed(
        const Duration(seconds: 2),
        () => customerPresenter.updateAllDetails(context, widget._image, widget._name, 
        widget._phone));
      }
   
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