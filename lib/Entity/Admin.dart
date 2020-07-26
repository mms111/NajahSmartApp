import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:najah_smartapp/Entity/User.dart';

class Admin implements User{

  String id;
  String email;
  String name;
  String photoUrl;
  String type;

  Admin({this.id, this.email,this.name, this.photoUrl, this.type});
  Admin.customConstructor();
  Admin.fromJson(Map<String, dynamic> json)
    : this(
        id: json['id'],
        email: json['email'],
        name: json['name'],
        photoUrl: json['photoUrl'],
        type: json['type']);

  Map<String, dynamic> toJson() =>
  {'id' : id, 'email': email, 'name': name, 'photoUrl' : photoUrl, 'type' : type};

  void fromFirebase(DocumentSnapshot data)
  {
    this.id = data['id'];
    this.email = data['email'];
    this.name = data['name'];
    this.photoUrl = data['photoUrl'];
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

  String getType()
  {
    return type;
  }


}