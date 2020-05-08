import 'package:flutter/material.dart';
import 'package:najah_smartapp/Entity/Customer.dart';
import 'package:najah_smartapp/View/Customer/CustomerAppBottomNavigationBar.dart';

class CustomerPresenter{

  Customer _customer;

  void setCustomer(Customer customer)
  {
    _customer = customer;
  }

  onRequest(BuildContext context, String screen)
  {
    switch(screen)
    {
      case '/mainScreen' :
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => CustomerAppBottomNavigationBar(_customer)),
          (Route<dynamic> route) => false,
        );
        break;
    }
  }
}