import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:najah_smartapp/Entity/Admin.dart';
import 'package:najah_smartapp/Entity/Customer.dart';
import 'package:najah_smartapp/Entity/Item.dart';
import 'package:najah_smartapp/Entity/TopUp.dart';
import 'package:najah_smartapp/Model/CustomerDao.dart';
import 'package:najah_smartapp/Model/ItemDao.dart';
import 'package:najah_smartapp/Model/TopUpDao.dart';
import 'package:najah_smartapp/Model/UserDao.dart';
import 'package:najah_smartapp/View/Admin/AdminAppBottomNavigationBar.dart';
import 'package:najah_smartapp/View/Admin/FinancialReportScreen.dart';
import 'package:najah_smartapp/View/Admin/ItemsList.dart';
import 'package:najah_smartapp/View/Admin/TopUpScreen.dart';
import 'package:najah_smartapp/View/Admin/UsersListScreen.dart';
import 'package:najah_smartapp/CustomWidgets/AlertDialogBox.dart';
import 'package:najah_smartapp/View/Customer/CustomerProfileScreen.dart';
import 'package:najah_smartapp/View/Admin/ManageShopScreen.dart';
import 'package:najah_smartapp/View/Admin/AddItemScreen.dart';
import 'package:najah_smartapp/View/Admin/ItemScreen.dart';

class AdminPresenter{

  Admin _admin;
  TopUpDao topUpDao = new TopUpDao();
  CustomerDao customerDao = new CustomerDao();
  Item item = new Item();
  ItemDao itemDao = new ItemDao();

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
      case '/usersList' :
        showUsersList(context);
        break;
      case '/topUp' :
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => TopUpScreen())
        );
        break;
      case '/financialReport' :
        topUpList(context);
        break;
      case '/logoutSplashScreen' :
        Navigator.of(context).pushReplacementNamed(screen);
        break;
      case '/manageShop' :
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ManageShopScreen())
        );
        break;
      case '/addItem' :
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => AddItemScreen())
        );
        break;
      case '/itemsList' :
        itemList(context);
      break;
      
    }
  }

  
  Future showUsersList(BuildContext context) async
  {
    var users = await customerDao.customerList();
    if(users.runtimeType==String)
    {
     
      return AlertDialogBox(context, "Sorry!", users);
    }
    else
    {
      Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => UsersListScreen(users)));
    }
    
   
  }

  showUserProfile(BuildContext context, Customer customer)
  {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => CustomerProfileScreen(customer))
    );
  }
  
 

  Future topUp(BuildContext context, String email, double amount) async
  {
    var result = await UserDao().getUserByEmail(email);

    if(result.runtimeType==String)
    {
      return AlertDialogBox(context, "Error!", result);
    }
    else
    {
      var user = result.documents.first;
      Customer customer = new Customer();
      customer.fromFirebase(user);
      await customerDao.updateCustomerAmount(customer, amount);
      TopUp topUp = new TopUp(Timestamp.now(), customer.id, customer.name, amount);
      await topUpDao.addTopUp(topUp);
      customer.setCredit(customer.credit+amount);
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

  Future topUpList(BuildContext context) async
  {
    var topups = await topUpDao.topUpList();
    if(topups.runtimeType==String)
    {
      return AlertDialogBox(context, "Sorry!", topups);
    }
    else
    {
      Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => FinancialReportScreen(topups)));
    }
  }

  Future addItem(BuildContext context, File image, String name, double price) async
  {
    var result = await itemDao.uploadImage(image);
    if(result.runtimeType==String)
    {
      String url = result;
      item.setName(name);
      item.setPrice(price);
      item.setPhotoUrl(url);
      var addItem = await itemDao.addItem(item);
      if(addItem.runtimeType==String)
      {
        Navigator.of(context).pop();
        return AlertDialogBox(context, "Error!", addItem.message);
      }
      else
      {
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => AddItemScreen()));
        return AlertDialogBox(context, "Added!", "Your item has been added successfully.");
       
      }

    }
    else
    {
       Navigator.of(context).pop();
       return AlertDialogBox(context, "Error!", result.message);
    }
  }



  Future itemList(BuildContext context) async
  {
    var items = await itemDao.itemList();
    if(items.runtimeType==String)
    {
      return AlertDialogBox(context, "Sorry!", items);
    }
    else
    {
      Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => ItemListScreen(items)));
    }
  }


  showItem(BuildContext context, Item item)
  {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => ItemScreen(item))
    );
  }

  deleteItem(BuildContext context, Item item)
  {
    
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text("Are you sure?"),
        content: Text("You really want to delete this item?"),
        actions: <Widget>[
          FlatButton(
            child: Text('Yes'),
            onPressed: () async {
              await itemDao.deleteItem(item);
              var items = await itemDao.itemList();
              if(items.runtimeType==String)
              {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                List<Item> itemslist = new List<Item>();
                Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => ItemListScreen(itemslist)));
              }
              else
              {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => ItemListScreen(items)));
              }
              return AlertDialogBox(context, "Deleted!", "Item has been deleted successfully.");
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