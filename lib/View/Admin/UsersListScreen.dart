import 'package:flutter/material.dart';
import 'package:najah_smartapp/Entity/Customer.dart';
import 'package:najah_smartapp/Model/MockData.dart';
import 'package:najah_smartapp/Presenter/AdminPresenter.dart';

class UsersListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            "Users List"
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.only(top: 25.0),
          child: ListView(
            children: customersList.map((customer)=>userRow(context,customer)).toList()
          )
        ),
      ),
    );
  }

  Widget userRow(BuildContext context, Customer customer)
  {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.green,
          )
        )
      ),
      child: Row(
        
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              (customersList.indexOf(customer)+1).toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              customer.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () {
                AdminPresenter().showUserProfile(context, customer);
              },
              child: Text(
                "View",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline
                ),
              ),
            ),
          ),
           Expanded(
            flex: 2,
            child: InkWell(
              onTap: () {
                AdminPresenter().deleteUser(context, customer);
              },
              child: Text(
                "Delete",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}