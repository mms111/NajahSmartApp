import 'package:flutter/material.dart';
import 'package:najah_smartapp/Entity/Admin.dart';
import 'package:najah_smartapp/Entity/Customer.dart';
import 'package:najah_smartapp/Entity/Package.dart';
import 'package:najah_smartapp/Entity/TopUp.dart';

Admin admin = new Admin(
  "mohammadmohsin369@gmail.com",
  "123",
  "Muhammad Mohsin",
  AssetImage('assets/ProfilePictures/mms.jpg')
  );

List<Customer> customersList = [

    Customer("mms@gmail.com",
    "12345",
    "Mohsin Shaikh",
    AssetImage('assets/ProfilePictures/mohsin.jpg'),
    "+6011-39795739",
    100.0
    )

];

List<TopUp> topUpList = [
  TopUp(customersList[0], DateTime(2020,4,17), 100.0),
  TopUp(customersList[0], DateTime(2020,4,20), 50.0),
];

List<Package> packagesList = [
  Package("BASIC PACKAGE", "1 Month", 60.0),
  Package("PRIMARY PACKAGE", "3 Months", 150.0),
];