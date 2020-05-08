import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:najah_smartapp/Entity/Customer.dart';
import 'package:najah_smartapp/Entity/Admin.dart';
import 'package:najah_smartapp/Model/CustomerDao.dart';
import 'package:najah_smartapp/Model/AdminDao.dart';
import 'package:najah_smartapp/Presenter/CustomerPresenter.dart';
import 'package:najah_smartapp/Presenter/AdminPresenter.dart';
import 'package:najah_smartapp/CustomWidgets/AlertDialogBox.dart';

class LoginPresenter{

  Customer _customer = Customer.customConstructor();
  Admin _admin = Admin.customConstructor();
  CustomerDao customerDao = new CustomerDao();
  AdminDao adminDao = new AdminDao();
  
  validateUser (BuildContext context, String email, String pass) async
  {
    _customer.setEmail(email);
    _customer.setPass(pass);
    _admin.setEmail(email);
    _admin.setPass(pass);
    
    if(customerDao.validateCustomer(_customer))
    {
      CustomerPresenter customerPresenter = CustomerPresenter();
      customerPresenter.setCustomer(_customer);
      customerPresenter.onRequest(context, '/mainScreen');
    }

    else if(adminDao.validateAdmin(_admin))
    {
      AdminPresenter adminPresenter = AdminPresenter();
      adminPresenter.setAdmin(_admin);
      adminPresenter.onRequest(context, '/mainScreen');
    }

    else
    {
      Navigator.of(context).pop();
      return AlertDialogBox(context, "Can't find account", "incorrect email or password");
    }

  }

}