import 'package:flutter/material.dart';

class Customer{

  String _email = "mohammadmohsin369@gmail.com";
  String _password = "123";
  String _name = "Muhammad Mohsin";
  String _phone = "+6011-39795739";
  AssetImage _profilePic = AssetImage('ProfilePictures/mms.jpg');

  get email => _email;
  get password => _password;
  get name => _name;
  get profilePicture => _profilePic;
  get phone => _phone;

}