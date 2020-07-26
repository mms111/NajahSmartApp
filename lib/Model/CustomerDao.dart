import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:najah_smartapp/Entity/Customer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

class CustomerDao{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future uploadImage(File image) async
  {
    try
    {
      String fileName = image.path;
      StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(image);
      await uploadTask.onComplete;
      var url = await firebaseStorageRef.getDownloadURL() as String;
      return url;
    } catch(e)
    {
      return e;
    }
  }

  Future updatePhotoUrl(String id, String url) async
  {
    final CollectionReference _usersCollectionReference =
      Firestore.instance.collection("users");
    try
    {
       var result = await _usersCollectionReference.document(id).updateData({'photoUrl' : url});
       return result;
    } catch(e)
    {
      return e.message;
    }
  }

  Future updateUserDetails(String id, String name, String phone) async
  {
    final CollectionReference _usersCollectionReference =
      Firestore.instance.collection("users");
    try
    {
       var result = await _usersCollectionReference.document(id).updateData({'name' : name,
       'phone' : phone});
       return result;
    } catch(e)
    {
      return e.message;
    }
  }

  

  Future customerList() async
  {
    final CollectionReference _usersCollectionReference =
      Firestore.instance.collection("users");

    var result = await _usersCollectionReference.getDocuments();
    
   
      var users = result;
      List<Customer> customersList = new List<Customer>();
      for(int i=0; i<users.documents.length; i++)
      {
        Customer customer = new Customer();
        customer.fromFirebase(users.documents[i]);
        if(customer.type=='customer')
        {
          customersList.add(customer);
        }

      }

      if(customersList.isEmpty)
      {
        return "Currently dont have any user.";
      }
      else
      {
        return customersList;
      }
    
      
  }

   Future deleteUser(Customer customer) async
  { 
   
      FirebaseUser user = await _firebaseAuth.currentUser();
      user.delete();
      _firebaseAuth.signOut();
      
      final CollectionReference _usersCollectionReference =
        Firestore.instance.collection("users");
      
      await _usersCollectionReference.document(customer.id).delete();      
    
  }

  Future updateCustomerAmount(Customer customer, double amount) async
  {
     
     Firestore.instance.collection("users").document(customer.id).updateData({'credit' : customer.credit+amount});

  }

  Future deductCustomerAmount(Customer customer) async
  {
     
     await Firestore.instance.collection("users").document(customer.id).updateData({'credit' : customer.credit});

  }

  
}