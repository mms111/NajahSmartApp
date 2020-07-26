import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:najah_smartapp/Entity/TopUp.dart';

class TopUpDao {
  
  
  Future addTopUp(TopUp topup) async
  {
     
      Firestore.instance.collection("topup").document().setData(topup.toJson());

  }

  Future topUpList() async
  {
    final CollectionReference _usersCollectionReference =
      Firestore.instance.collection("topup");

    var result = await _usersCollectionReference.getDocuments();
    var isEmpty = result.documents.isEmpty;
    if(isEmpty)
    {
      return "Currently dont have any topups.";
    }
    else
    {
      var topups = result;
      List<TopUp> topupsList = new List<TopUp>();
      for(int i=0; i<topups.documents.length; i++)
      {
        TopUp topup = new TopUp.customConstructor();
        topup.fromFirebase(topups.documents[i]);
        
        topupsList.add(topup);

      }
      return topupsList;
    }
    
      
  }

   Future customerTopUpList(String id) async
  {
    final CollectionReference _usersCollectionReference =
      Firestore.instance.collection("topup");

    var result = await _usersCollectionReference.where('customerId', isEqualTo: id).getDocuments();
    var isEmpty = result.documents.isEmpty;
    if(isEmpty)
    {
      return "Currently you dont have any topups.";
    }
    else
    {
      var topups = result;
      List<TopUp> topupsList = new List<TopUp>();
      for(int i=0; i<topups.documents.length; i++)
      {
        TopUp topup = new TopUp.customConstructor();
        topup.fromFirebase(topups.documents[i]);
        
        topupsList.add(topup);

      }
      return topupsList;
    }
    
      
  }

   

  
}