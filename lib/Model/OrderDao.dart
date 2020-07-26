import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:najah_smartapp/Entity/Order.dart';


class OrderDao {

  Future addOrder(Order order) async
  {
    try
    {
      var result = await Firestore.instance.collection("orders").add(order.toJson());
      return result;
    } catch(e)
    {
      return e.message;
    }
    
  }

  Future customerOrderList(String id) async
  {
    final CollectionReference _usersCollectionReference =
    Firestore.instance.collection("orders");

    var result = await _usersCollectionReference.where('customerId', isEqualTo: id).getDocuments();
    var isEmpty = result.documents.isEmpty;
    if(isEmpty)
    {
      return "Currently you dont have any orders.";
    }
    else
    {
      var topups = result;
      List<Order> ordersList = new List<Order>();
      for(int i=0; i<topups.documents.length; i++)
      {
        Order order = new Order();
        order.fromFirebase(topups.documents[i]);
        
        ordersList.add(order);

      }
      return ordersList;
    }
    
      
  }

    
}