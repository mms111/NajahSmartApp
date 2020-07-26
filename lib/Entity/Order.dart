import 'package:cloud_firestore/cloud_firestore.dart';

class Order
{
  String customerId;
  Timestamp date;
  String itemName;
  double itemPrice;

  Order({this.customerId, this.date,this.itemName, this.itemPrice});
  Order.customConstructor();

  Map<String, dynamic> toJson() =>
  {'customerId': customerId, 'itemName' : itemName, 'date' : date, 'itemPrice' : itemPrice};

  void fromFirebase(DocumentSnapshot data)
  {
    this.customerId = data['customerId'];
    this.date = data['date'];
    this.itemName = data['itemName'];
    this.itemPrice = data['itemPrice'];
  }



  
  void setCustomerId(String id)
  {
    this.customerId = id;
  }

  
  void setDate(Timestamp date)
  {
    this.date = date;
  }

  
  void setItemName(String name)
  {
    this.itemName=name;
  }

  
  void setItemPrice(double price)
  {
    this.itemPrice=price;
  }

}