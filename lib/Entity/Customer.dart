import 'User.dart';
import 'package:flutter/material.dart';
class Customer implements User {

  String _email;
  String _password;
  String _name;
  AssetImage _profilePic = AssetImage('assets/ProfilePictures/default.png');
  String _phone;
  double _credit = 0.0;

  Customer(this._email, this._password, this._name, this._profilePic, this._phone, this._credit);
  Customer.customConstructor();

  @override
  void setEmail(String email)
  {
    _email = email;
  }

  @override
  void setPass(String pass)
  {
    _password = pass;
  }

  @override
  void setName(String name)
  {
    _name = name;
  }

  @override
  void setProfilePic(AssetImage image)
  {
    _profilePic = image;
  }
  
  void setPhone(String phone)
  {
    _phone = phone;
  }

  void setCredit(double crediit)
  {
    _credit = crediit;
  }

  @override
  get email => _email;
  @override
  get password => _password;
  @override
  get name => _name;
  @override
  get profilePicture => _profilePic;
  get phone => _phone;
  get credit => _credit;

}