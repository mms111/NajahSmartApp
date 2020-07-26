import 'dart:io';
import 'package:najah_smartapp/Presenter/AdminPresenter.dart';
import 'package:flutter/material.dart';

class AddItemSplashScreen extends StatefulWidget {
  final String _name;
  final double _price;
  final File _image;
  AddItemSplashScreen(this._image, this._name, this._price);
  @override
  _AddItemSplashScreenState createState() => _AddItemSplashScreenState();
}

class _AddItemSplashScreenState extends State<AddItemSplashScreen> {

  @override
  void initState(){

    super.initState();
    new Future.delayed(
        const Duration(seconds: 2),
        () => AdminPresenter().addItem(context, widget._image, widget._name, widget._price));
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