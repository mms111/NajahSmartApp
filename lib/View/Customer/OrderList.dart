import 'package:flutter/material.dart';
import 'package:najah_smartapp/Entity/Order.dart';

class OrderListScreen extends StatelessWidget {

  final List<Order> _orderList;
  OrderListScreen(this._orderList);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            "Top-up List"
          ),
          centerTitle: true,
        ),
        body: Container(
          child: ListView(
            children: _orderList.map((order)=>orderRow(context,order)).toList()
          ),
        ),
      ),
    
    );
    
  }

  Widget orderRow(BuildContext context, Order order)
  {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Container(
        padding: EdgeInsets.all(8.0),
        color: Colors.blueGrey[800],
        child: Row(
          
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Text(
                (_orderList.indexOf(order)+1).toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                order.date.toDate().day.toString() + '/' + 
                order.date.toDate().month.toString() + '/' +
                order.date.toDate().year.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                order.itemName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
             Expanded(
              flex: 3,
              child: Text(
                "RM"+order.itemPrice.toString() + "0",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  
}