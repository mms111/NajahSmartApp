import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:najah_smartapp/Entity/Item.dart';

class ItemDao{

  Future uploadImage(File image) async{
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

  Future addItem(Item item) async
  {
    try
    {
      var result = await Firestore.instance.collection("items").add(item.toJson());
      return result;
    } catch(e)
    {
      return e.message;
    }
    
  }

  Future itemList() async
  {
    final CollectionReference _usersCollectionReference =
      Firestore.instance.collection("items");

    var result = await _usersCollectionReference.getDocuments();
    var isEmpty = result.documents.isEmpty;
    if(isEmpty)
    {
      return "Currently dont have any items.";
    }
    else
    {
      var items = result;
      List<Item> itemsList = new List<Item>();
      for(int i=0; i<items.documents.length; i++)
      {
        Item item = new Item.customConstructor();
        item.fromFirebase(items.documents[i]);
        
        itemsList.add(item);

      }
      return itemsList;
    }
    
  }

  Future deleteItem(Item item) async
  {
    var result = await Firestore.instance.collection("items").where('name', isEqualTo : item.name).getDocuments();
    String id = result.documents[0].documentID;
    print(id);
    await Firestore.instance.collection("items").document(id).delete();
    
  }
  
}