import 'package:flutter/material.dart';
import 'package:najah_smartapp/Entity/TopUp.dart';

class TopUpListScreen extends StatelessWidget {

  final List<TopUp> _topUpList;
  TopUpListScreen(this._topUpList);

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
            children: _topUpList.map((topUp)=>topUpRow(context,topUp)).toList()
          ),
        ),
      ),
    
    );
    
  }

  Widget topUpRow(BuildContext context, TopUp topUp)
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
                (_topUpList.indexOf(topUp)+1).toString(),
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
                topUp.getDate().toDate().day.toString() + '/' + 
                topUp.getDate().toDate().month.toString() + '/' +
                topUp.getDate().toDate().year.toString(),
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
                topUp.getCustomerName(),
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
                "RM"+topUp.getAmount().toString() + "0",
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