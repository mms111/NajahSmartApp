import 'package:flutter/material.dart';
import 'package:najah_smartapp/Entity/Customer.dart';
import 'package:najah_smartapp/Presenter/AdminPresenter.dart';

class UsersListScreen extends StatelessWidget {
  final List<Customer> _customersList;
  UsersListScreen(this._customersList);
  

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
          child: ListView(
            children: _customersList.map((customer)=>userRow(context,customer)).toList()
          )
        ),
      ),
    );
  }


  Widget userRow(BuildContext _context, Customer customer)
  {
    return Padding(
      padding: EdgeInsets.only(top: 12.0),
      child: Container(
        height: MediaQuery.of(_context).size.height * 0.075,
        color: Colors.blueGrey[800],
        child: Center(
          child: ListTile(
            leading: ClipOval(
                child: new SizedBox(
                  width: MediaQuery.of(_context).size.height * 0.06,
                  height: MediaQuery.of(_context).size.height * 0.06,
                  child: Image.network(
                    customer.photoUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            title: Text(
                  customer.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
            onTap: (){
              AdminPresenter().showUserProfile(_context, customer);
            },
            
          ),
        ),
      ),
    );
  }
}