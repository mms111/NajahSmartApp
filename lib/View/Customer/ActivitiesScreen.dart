import 'package:flutter/material.dart';
import 'package:najah_smartapp/Entity/Customer.dart';
import 'package:najah_smartapp/Presenter/CustomerPresenter.dart';

class ActivitiesScreen extends StatelessWidget {

  final Customer _customer;
  ActivitiesScreen(this._customer);
  
  
  @override
  Widget build(BuildContext context) {

    CustomerPresenter customerPresenter = new CustomerPresenter();
    customerPresenter.setCustomer(_customer);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Activities"),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[

            Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.075,
                color: Colors.blueGrey[800],
                child: Center(
                  child: ListTile(
                    leading: Icon(
                      Icons.attach_money,
                      size: MediaQuery.of(context).size.height * 0.035,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Top-ups List",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ),
                    onTap: () {
                      customerPresenter.onRequest(context, "/topUpList");
                    },
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.075,
                color: Colors.blueGrey[800],
                child: Center(
                  child: ListTile(
                    leading: Icon(
                      Icons.shopping_cart,
                      size: MediaQuery.of(context).size.height * 0.035,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Orders List",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ),
                    onTap: () {
                      customerPresenter.onRequest(context, "/orderList");
                    },
                  ),
                ),
              ),
            )
           
           
          ],
        )
      ),
    );
  }
}