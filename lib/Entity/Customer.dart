import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:najah_smartapp/Entity/User.dart';

class Customer implements User{

  String id;
  String email;
  String name;
  String photoUrl;
  String phone;
  double credit;
  String type;

  Customer({this.id, this.email, 
            this.name, this.photoUrl, this.phone, 
            this.credit, this.type});
            
  Customer.customConstructor();

  Customer.fromJson(Map<String, dynamic> json)
    : this(
        id: json['id'],
        email: json['email'],
        name: json['name'],
        photoUrl : json['photoUrl'],
        phone: json['phone'],
        credit: json['credit'],
        type: json['type']);

  Map<String, dynamic> toJson() =>
  {'id': id, 'email': email, 
   'name': name, 'photoUrl' : photoUrl, 'phone': phone, 
   'credit' : credit, 'type' : type};

   void fromFirebase(DocumentSnapshot data)
  {
    this.id = data['id'];
    this.email = data['email'];
    this.name = data['name'];
    this.photoUrl = data['photoUrl'];
    this.phone = data['phone'];
    this.credit = data['credit'];
    this.type = data['type'];
  }


  @override
  void setId(String id)
  {
    this.id = id;
  }

  @override
  void setEmail(String email)
  {
    this.email = email;
  }

  @override
  void setName(String name)
  {
    this.name = name;
  }

  @override
  void setPhotoUrl(String photoUrl)
  {
    this.photoUrl = photoUrl;
  }

  @override
  void setType(String type)
  {
    this.type= type;
  }

  void setPhone(String phone)
  {
    this.phone = phone;
  }
  
  void setCredit(double credit)
  {
    this.credit = credit;
  }

  String getId()
  {
    return id;
  }

  String getEmail()
  {
    return email;
  }

  String getName()
  {
    return name;
  }

  String getPhotoUrl()
  {
    return photoUrl;
  }

  String getPhone()
  {
    return phone;
  }

  double getCredit()
  {
    return credit;
  }


  String getType()
  {
    return type;
  }

}