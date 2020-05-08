import 'package:flutter/material.dart';
import 'package:najah_smartapp/Entity/Admin.dart';
import 'package:najah_smartapp/Entity/Customer.dart';
import 'package:najah_smartapp/Model/AdminDao.dart';
import 'package:najah_smartapp/Model/CustomerDao.dart';
import 'package:najah_smartapp/View/Admin/AddUserScreen.dart';
import 'package:najah_smartapp/View/Admin/AdminAppBottomNavigationBar.dart';
import 'package:najah_smartapp/View/Admin/ManageUsersScreen.dart';
import 'package:najah_smartapp/View/Admin/UsersListScreen.dart';
import 'package:najah_smartapp/CustomWidgets/AlertDialogBox.dart';
import 'package:najah_smartapp/View/Customer/CustomerProfileScreen.dart';

class AdminPresenter{

  Admin _admin;
  AdminDao adminDao = new AdminDao();

  void setAdmin(Admin admin)
  {
    _admin = admin;
  }

  onRequest(BuildContext context, String screen)
  {
    switch(screen)
    {
      case '/mainScreen' :
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => AdminAppBottomNavigationBar(_admin)),
          (Route<dynamic> route) => false,
        );
        break;
      case '/manageUsers' :
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ManageUsersScreen())
        );
        break;
      case '/addUser' :
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => AddUserScreen())
        );
        break;
      case '/usersList' :
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => UsersListScreen())
        );
        break;
    }
  }

  addUser(BuildContext context, String name, String email, String password, String phone)
  {
    bool userExists = false;
    CustomerDao customerDao = new CustomerDao();

    if(adminDao.findAdmin(email))
    {
      userExists = true;
    }

    if(customerDao.findCustomer(email))
    {
      userExists = true;
    }

    if(userExists)
    {
      return AlertDialogBox(context, "Error!", "User already exists.");
    }

    else
    {
      Customer customer = Customer.customConstructor();
      customer.setName(name);
      customer.setEmail(email);
      customer.setPass(password);
      customer.setPhone(phone);
      adminDao.addUser(customer);
      Navigator.of(context).pop();
      return AlertDialogBox(context, "Successfully Added!", customer.name + "'s account has been created successfully.");
    }
   
  }

  showUserProfile(BuildContext context, Customer customer)
  {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => CustomerProfileScreen(customer))
    );
  }

  deleteUser(BuildContext context, Customer customer)
  {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text("Are you sure?"),
        content: Text("You really want to delete " + customer.name + "'s account?"),
        actions: <Widget>[
          FlatButton(
            child: Text('Yes'),
            onPressed: () {
              adminDao.deleteUser(customer);
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => UsersListScreen())
              );
            },
            color: Colors.red,
          ),
          FlatButton(
            child: Text('No'),
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: Colors.green,
          )
        ],
        backgroundColor: Colors.blueGrey[50],
      )
    );
  }
}