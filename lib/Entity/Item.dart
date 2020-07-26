import 'package:cloud_firestore/cloud_firestore.dart';

class Item{

  String name;
  String photoUrl;
  double price;

  Item({this.name, this.photoUrl, this.price});
  Item.customConstructor();

  Map<String, dynamic> toJson() =>
  {'name': name, 'photoUrl' : photoUrl, 'price' : price};

  void fromFirebase(DocumentSnapshot data)
  {
    this.name = data['name'];
    this.photoUrl = data['photoUrl'];
    this.price = data['price'];
  }



  
  void setName(String name)
  {
    this.name = name;
  }

  
  void setPhotoUrl(String photoUrl)
  {
    this.photoUrl = photoUrl;
  }

  
  void setPrice(double price)
  {
    this.price=price;
  }

  String getName()
  {
    return name;
  }

  String getPhotoUrl()
  {
    return photoUrl;
  }

  double getPrice()
  {
    return price;
  }


}