import 'package:najah_smartapp/Entity/User.dart';
import 'package:flutter/material.dart';
class Admin implements User{

  String _email;
  String _password;
  String _name;
  AssetImage _profilePic;

  Admin(this._email,this._password,this._name, this._profilePic);
  Admin.customConstructor();
  
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

  @override
  get email => _email;
  @override
  get password => _password;
  @override
  get name => _name;
  @override
  get profilePicture => _profilePic;
  
}