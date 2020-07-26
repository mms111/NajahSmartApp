

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:najah_smartapp/Entity/Customer.dart';

class UserDao{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future addCustomer(String name, String email, String password, String phone) async
  {
    try 
    {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      Customer customer = new Customer();

      customer.setId(authResult.user.uid);
      customer.setName(name);
      customer.setEmail(email);
      customer.setPhone(phone);
      customer.setPhotoUrl("https://firebasestorage.googleapis.com/v0/b/najah-smart-app-map.appspot.com/o/default.png?alt=media&token=1e861a52-8c62-48c3-8405-35303491b82a");
      customer.setCredit(0.00);
      customer.setType("customer");

      final CollectionReference _usersCollectionReference =
      Firestore.instance.collection("users");

      try {
      await _usersCollectionReference.document(customer.id).setData(customer.toJson());
    } catch (e) {
      return e.message;
    }
      return authResult.user;
    } catch (e) {
      return e.message;
    }
  }


  Future loginUser(String email, String password) async {

    try{
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return authResult.user;
    } catch(e)
    {
      return "incorrect email or password";
    }

  }

  Future getUser(String id) async
  {
    final CollectionReference _usersCollectionReference =
      Firestore.instance.collection("users");
    
    var result = await _usersCollectionReference.where('id', isEqualTo: id).getDocuments();
    
      var user = result.documents.first;
      return user;

  }

  Future getUserByEmail(String email) async
  {
    final CollectionReference _usersCollectionReference =
      Firestore.instance.collection("users");
    
      var result =  await _usersCollectionReference.where('email', isEqualTo: email).getDocuments();
      var user = result.documents.isEmpty;
      if(user)
      {
        return "User not found with the given email address.";
      }
      else
      {
        return result;
      }
      
  }

  Future loggedInUser() async {

    try{
      var user = await _firebaseAuth.currentUser();
      return user;
    } catch(e)
    {
      return null;
    }
    
  }

  Future logoutUser() async{
    try{
    var user = await _firebaseAuth.signOut();
    return user;
    } catch(e)
    {
      return e.message;
    }
  }

  Future sendPasswordResetEmail(String email) async{
    try{
    var user = await _firebaseAuth.sendPasswordResetEmail(email: email);
    return user;
    } catch(e)
    {
      return e.message;
    }
  }

  
}