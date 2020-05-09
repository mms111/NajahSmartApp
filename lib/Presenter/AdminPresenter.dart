import 'package:flutter/material.dart';
import 'package:najah_smartapp/Entity/Admin.dart';
import 'package:najah_smartapp/Entity/Customer.dart';
import 'package:najah_smartapp/Entity/Package.dart';
import 'package:najah_smartapp/Model/AdminDao.dart';
import 'package:najah_smartapp/Model/CustomerDao.dart';
import 'package:najah_smartapp/Model/PackageDao.dart';
import 'package:najah_smartapp/Model/TopUpDao.dart';
import 'package:najah_smartapp/View/Admin/AddPackageScreen.dart';
import 'package:najah_smartapp/View/Admin/AddUserScreen.dart';
import 'package:najah_smartapp/View/Admin/AdminAppBottomNavigationBar.dart';
import 'package:najah_smartapp/View/Admin/FinancialReportScreen.dart';
import 'package:najah_smartapp/View/Admin/ManagePackagesScreen.dart';
import 'package:najah_smartapp/View/Admin/ManageUsersScreen.dart';
import 'package:najah_smartapp/View/Admin/PackagesListScreen.dart';
import 'package:najah_smartapp/View/Admin/SelectFinancialReportScreen.dart';
import 'package:najah_smartapp/View/Admin/TopUpScreen.dart';
import 'package:najah_smartapp/View/Admin/UsersListScreen.dart';
import 'package:najah_smartapp/CustomWidgets/AlertDialogBox.dart';
import 'package:najah_smartapp/View/Customer/CustomerProfileScreen.dart';

class AdminPresenter{

  Admin _admin;
  AdminDao adminDao = new AdminDao();
  TopUpDao topUpDao = new TopUpDao();
  CustomerDao customerDao = new CustomerDao();
  PackageDao packageDao = new PackageDao();

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
        showUsersList(context);
        break;
      case '/topUp' :
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => TopUpScreen())
        );
        break;
      case '/selectFinancialReport' :
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => SelectFinancialReportScreen())
        );
        break;
      case '/financialReport' :
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => FinancialReportScreen())
        );
        break;
      case '/managePackages' :
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ManagePackagesScreen())
        );
        break;
      case '/addPackage' :
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => AddPackageScreen())
        );
        break;
      case '/packagesList' :
        showpackagesList(context);
        break;
      case '/logoutSplashScreen' :
        Navigator.of(context).pushReplacementNamed(screen);
        break;
      
    }
  }

  addUser(BuildContext context, String name, String email, String password, String phone)
  {
    bool userExists = false;
    

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
      customerDao.addCustomer(customer);
      Navigator.of(context).pop();
      return AlertDialogBox(context, "Successfully Added!", customer.name + "'s account has been created successfully.");
    }
   
  }

  showUsersList(BuildContext context)
  {
    List<Customer> customerList = customerDao.customerList();
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => UsersListScreen(customerList)));
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
              customerDao.deleteCustomer(customer);
              Navigator.of(context).pop();
              List<Customer> customersList = customerDao.customerList(); 
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => UsersListScreen(customersList))
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

  topUp(BuildContext context, String email, double amount)
  {
    Customer customer = customerDao.getCustomer(email);
    if(customer==null)
    {
      return AlertDialogBox(context, "Error!", "User not found.");
    }
    else
    {
      topUpDao.updateUserAmount(customer, amount);
       Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => TopUpScreen())
      );
      return AlertDialogBox(
        context, 
        "Top-up Successful.", 
        "RM" +amount.toString() +"0 has been successfully added to " + customer.name + "'s account."
      );
    }
  }

  addPackage(BuildContext context, String title, String validity, double price)
  {
    if(packageDao.findPackage(title))
    {
      return AlertDialogBox(
        context, 
        "Error!", 
        title + " already exits."
      );
    }
    else
    {
      Package package = Package.customConstructor();
      package.setTitle(title.toUpperCase());
      package.setValidity(validity);
      package.setPrice(price);
      packageDao.addPackage(package);
      Navigator.of(context).pop();
      return AlertDialogBox(context, "Successfully Added!", package.title+ " has been added successfully");

    }
  }

  showpackagesList(BuildContext context)
  {
    List<Package> packagesList = packageDao.packageList();
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => PackagesListScreen(packagesList)));
  }

  deletPackage(BuildContext context, Package package)
  {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text("Are you sure?"),
        content: Text("You really want to delete " + package.title),
        actions: <Widget>[
          FlatButton(
            child: Text('Yes'),
            onPressed: () {
              packageDao.deletePackage(package);
              Navigator.of(context).pop();
              List<Package> packagesList = packageDao.packageList(); 
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => PackagesListScreen(packagesList))
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