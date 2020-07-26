import 'package:flutter/material.dart';
import 'package:najah_smartapp/Entity/Customer.dart';
import 'package:najah_smartapp/Entity/Item.dart';
import 'package:najah_smartapp/Presenter/CustomerPresenter.dart';

class ShopScreen extends StatelessWidget {
  final List<Item> _itemsList;
  final Customer _customer;
  ShopScreen(this._itemsList, this._customer);
  CustomerPresenter customerPresenter = new CustomerPresenter();

  @override
  Widget build(BuildContext context) {
    customerPresenter.setCustomer(_customer);
    
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            "Shop"
          ),
          centerTitle: true,
        ),
        body: Container(
          child: ListView(
            children: _itemsList.map((item)=>itemRow(context,item)).toList()
          )
        ),
      ),
    );
  }


  Widget itemRow(BuildContext _context, Item item)
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
                    item.photoUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            title: Text(
                  item.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                  ),
                ),

            trailing: Text(
                  "RM:" + item.price.toString() + "0",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                  ),
            ),
            
            onTap: (){
               customerPresenter.showItem(_context, item);
            },
            
          ),
        ),
      ),
    );
  }
}