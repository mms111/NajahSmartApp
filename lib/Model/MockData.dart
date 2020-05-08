import 'package:flutter/material.dart';
import 'package:najah_smartapp/Entity/Admin.dart';
import 'package:najah_smartapp/Entity/Customer.dart';

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