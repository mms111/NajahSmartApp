import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:najah_smartapp/CustomWidgets/AlertDialogBox.dart';
import 'package:najah_smartapp/Entity/Customer.dart';
import 'package:najah_smartapp/Entity/Item.dart';
import 'package:najah_smartapp/Entity/TopUp.dart';
import 'package:najah_smartapp/Model/CustomerDao.dart';
import 'package:najah_smartapp/Model/ItemDao.dart';
import 'package:najah_smartapp/Model/TopUpDao.dart';
import 'package:najah_smartapp/View/Customer/DeleteAccountSplashScreen.dart';
import 'package:najah_smartapp/View/Customer/ShopScreen.dart';
import 'package:najah_smartapp/View/Customer/CustomerAppBottomNavigationBar.dart';
import 'package:najah_smartapp/View/Customer/CustomerEditProfileScreen.dart';
import 'package:najah_smartapp/View/Customer/CustomerTopUp.dart';
import 'package:najah_smartapp/View/Customer/ActivitiesScreen.dart';
import 'package:najah_smartapp/View/Customer/TopUpList.dart';
import 'package:najah_smartapp/View/Customer/ItemScreen.dart';
import 'package:najah_smartapp/Model/OrderDao.dart';
import 'package:najah_smartapp/Entity/Order.dart';
import 'package:najah_smartapp/View/Customer/OrderList.dart';

class CustomerPresenter{

  Customer _customer;
  CustomerDao customerDao = new CustomerDao();
  TopUpDao topUpDao = new TopUpDao();
  ItemDao itemDao = new ItemDao();
  OrderDao orderDao = new OrderDao();

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
      case '/editProfileScreen' :
         Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CustomerEditProfile(_customer))
        );
        break;
      case '/topUpScreen' :
         Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CustomerTopUpScreen(_customer))
        );
        break;
       case '/activitiesScreen' :
         Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ActivitiesScreen(_customer))
        );
        break;
      case '/topUpList' :
         topUpList(context);
        break;
      case '/orderList' :
         orderList(context);
        break;

    }
  }

  Future updateImage(BuildContext context, File image) async {
    var result = await customerDao.uploadImage(image);
    if(result.runtimeType==String)
    {
      var update = await customerDao.updatePhotoUrl(_customer.id, result);

      if(update.runtimeType==String)
      {
         Navigator.of(context).pop();
         return AlertDialogBox(context, "Error!", update);
      }
      else
      {
        _customer.setPhotoUrl(result);
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => CustomerEditProfile(_customer)));
        return AlertDialogBox(context, "Updated!", "Your profile picture has been updated successfully");

      }
    }

    else
    {
      Navigator.of(context).pop();
      return AlertDialogBox(context, "Error!", result.message);
    }
  }

  Future updateDetails(BuildContext context, String name, String phone) async
  {
    var result = await customerDao.updateUserDetails(_customer.id, name, phone);
    if(result.runtimeType==String)
    {
      Navigator.of(context).pop();
      return AlertDialogBox(context, "Error!", result);
    }
    else
    {
      _customer.setName(name);
      _customer.setPhone(phone);
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => CustomerEditProfile(_customer)));
      return AlertDialogBox(context, "Updated!", "Your profile details has been updated successfully");

    }
  }

  Future updateAllDetails(BuildContext context, File image, String name, String phone) async
  {
    print(image);
    var result = await customerDao.uploadImage(image);
    print(result);
    if(result.runtimeType==String)
    {
      var updateUrl = await customerDao.updatePhotoUrl(_customer.id, result);

      if(updateUrl.runtimeType==String)
      {
        Navigator.of(context).pop();
         return AlertDialogBox(context, "Error!", updateUrl);
      }
      else
      {
        _customer.setPhotoUrl(result);
        var update = await customerDao.updateUserDetails(_customer.id, name, phone);
        if(update.runtimeType==String)
        {
          Navigator.of(context).pop();
          return AlertDialogBox(context, "Error!", update);
        }
        else
        {
          _customer.setName(name);
          _customer.setPhone(phone);
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => CustomerEditProfile(_customer)));
          return AlertDialogBox(context, "Updated!", "Your profile details has been updated successfully");

        }

      }
    }

    else
    {
      Navigator.of(context).pop();
      return AlertDialogBox(context, "Error!", result.message);
    }
  }


  deleteConfirmation(BuildContext context)
  {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text("Are you sure?"),
        content: Text("You really want to delete your account?"),
        actions: <Widget>[
          FlatButton(
            child: Text('Yes'),
            onPressed: () async {

              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => DeleteAccountSplashScreen(_customer)));
              
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

  Future deleteUser(BuildContext context) async
  {
    
    await customerDao.deleteUser(_customer);
    Navigator.of(context).pushReplacementNamed('/home');
    return AlertDialogBox(context, "Deleted!", "Your accout has been deleted successfully.");

    
  }

  Future topUp(BuildContext context, Customer customer, double amount) async
  {
    
      await customerDao.updateCustomerAmount(customer, amount);
      TopUp topUp = new TopUp(Timestamp.now(), customer.id, customer.name, amount);
      await topUpDao.addTopUp(topUp);
      customer.setCredit(customer.credit+amount);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => CustomerTopUpScreen(customer))
      );
      return AlertDialogBox(
        context, 
        "Top-up Successful.", 
        "RM" +amount.toString() +"0 has been successfully added to your account."
      );

  }

  Future topUpList(BuildContext context) async
  {
    var topups = await topUpDao.customerTopUpList(_customer.id);
    if(topups.runtimeType==String)
    {
      return AlertDialogBox(context, "Sorry!", topups);
    }
    else
    {
      Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => TopUpListScreen(topups)));
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
      MaterialPageRoute(builder: (context) => ShopScreen(items, _customer)));
    }
  }

  showItem(BuildContext context, Item item)
  {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => ItemScreen(item, _customer))
    );
  }

  buyItem(BuildContext context, Item item)
  {
    if(_customer.credit<item.price)
    {
      return AlertDialogBox(context, "Sorry!", "You have insufficient balance.");
    }
    else
    {
      return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: Text("Confirmation"),
          content: Text("You want to buy this item?"),
          actions: <Widget>[
            FlatButton(
              child: Text('Yes'),
              onPressed: () async {
                
                double newCredit = _customer.credit - item.price;
                _customer.setCredit(newCredit);
                await customerDao.deductCustomerAmount(_customer);
                Order order = new Order();
                order.setCustomerId(_customer.id);
                order.setDate(Timestamp.now());
                order.setItemName(item.name);
                order.setItemPrice(item.price);
                var result = await orderDao.addOrder(order);
                if(result.runtimeType == String)
                {
                  return AlertDialogBox(context, "Sorry!", result);
                }
                else
                {
                  Navigator.of(context).pop();
                  return AlertDialogBox(context, "Thankyou!", "You successfully bought the item.");
                }
                
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

  Future orderList(BuildContext context) async
  {
    var orders = await orderDao.customerOrderList(_customer.id);
    if(orders.runtimeType==String)
    {
      return AlertDialogBox(context, "Sorry!", orders);
    }
    else
    {
      Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => OrderListScreen(orders)));
    }
  } 
 
  
}