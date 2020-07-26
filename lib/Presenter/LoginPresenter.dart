import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:najah_smartapp/Entity/Customer.dart';
import 'package:najah_smartapp/Entity/Admin.dart';
import 'package:najah_smartapp/Model/CustomerDao.dart';
import 'package:najah_smartapp/Presenter/CustomerPresenter.dart';
import 'package:najah_smartapp/Model/UserDao.dart';
import 'package:najah_smartapp/Presenter/AdminPresenter.dart';
import 'package:najah_smartapp/CustomWidgets/AlertDialogBox.dart';

class LoginPresenter{

  Customer _customer = Customer.customConstructor();
  Admin _admin = Admin.customConstructor();
  CustomerDao customerDao = new CustomerDao();
  UserDao userDao = new UserDao();
  
  Future validateUser (BuildContext context, String email, String pass) async
  {
    var result = await UserDao().loginUser(email, pass);

    if(result.runtimeType==String)
    {
      Navigator.of(context).pop();
      return AlertDialogBox(context, "Error!", result);
    }

    else
    {
      String id = result.uid;
      var user = await UserDao().getUser(id);
      Navigator.of(context).pop();
      
      if(user['type']=='admin')
      {
        _admin.fromFirebase(user);
        AdminPresenter adminPresenter = AdminPresenter();
        adminPresenter.setAdmin(_admin);
        adminPresenter.onRequest(context, '/mainScreen');
      }
      else if(user['type']=='customer')
      {
        _customer.fromFirebase(user);
        CustomerPresenter customerPresenter = CustomerPresenter();
        customerPresenter.setCustomer(_customer);
        customerPresenter.onRequest(context, '/mainScreen');
      }
      
    }

  }

  Future addUser(BuildContext context, String name, String email, String password, String phone) async
  {

      var result = await userDao.addCustomer(name, email, password, phone);

      if(result.runtimeType==String)
      {
        Navigator.of(context).pop();
        return AlertDialogBox(context, "Error!", result);
      }
      else
      {
        String id = result.uid;
        var user = await UserDao().getUser(id);
        Navigator.of(context).pop();
        if(user.runtimeType==String){
          Navigator.of(context).pop();
          return AlertDialogBox(context, "Error!", user);
        }
        else if(user['type']=='admin')
        {
          _admin.fromFirebase(user);
          AdminPresenter adminPresenter = AdminPresenter();
          adminPresenter.setAdmin(_admin);
          adminPresenter.onRequest(context, '/mainScreen');
        }
        else if(user['type']=='customer')
        {
          _customer.fromFirebase(user);
          CustomerPresenter customerPresenter = CustomerPresenter();
          customerPresenter.setCustomer(_customer);
          customerPresenter.onRequest(context, '/mainScreen');
        }
        
        return AlertDialogBox(context, "Welcome!", "Your account has been created successfully.");
      }
      
  }


  Future isUserLoggedIn(BuildContext context) async{

    var loggedInUser = await UserDao().loggedInUser();

    if(loggedInUser!=null)
    {
      String id = loggedInUser.uid;
      var user = await UserDao().getUser(id);
      Navigator.of(context).pop();

      if(user['type']=='admin')
      {
        _admin.fromFirebase(user);
        AdminPresenter adminPresenter = AdminPresenter();
        adminPresenter.setAdmin(_admin);
        adminPresenter.onRequest(context, '/mainScreen');
      }
      else if(user['type']=='customer')
      {
        _customer.fromFirebase(user);
        CustomerPresenter customerPresenter = CustomerPresenter();
        customerPresenter.setCustomer(_customer);
        customerPresenter.onRequest(context, '/mainScreen');
      }
      
    }
    else
    {
      Navigator.of(context).pushReplacementNamed('/home');
    }
  }

  Future logoutUser(BuildContext context) async{
    var user = await UserDao().logoutUser();
    if(user==null)
    {
      Navigator.of(context).pushReplacementNamed('/home');
    }
    else
    {
      return AlertDialogBox(context, "Error!", user);
    }
  }

  Future resetPassword(BuildContext context, String email) async
  {
    var result = await UserDao().sendPasswordResetEmail(email);

    if(result!=null)
    {
      AlertDialogBox(context, "Error!", result);
      
    }
    else{
      AlertDialogBox(context, "Check Email", "Password reset email has been sent to your email address");
    }
  }

}