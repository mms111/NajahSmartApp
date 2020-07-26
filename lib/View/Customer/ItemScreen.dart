import 'package:flutter/material.dart';
import 'package:najah_smartapp/Entity/Customer.dart';
import 'package:najah_smartapp/Entity/Item.dart';
import 'package:najah_smartapp/Presenter/CustomerPresenter.dart';

class ItemScreen extends StatelessWidget {
 
  final Item _item;
  final Customer _customer;
  ItemScreen(this._item, this._customer);

  CustomerPresenter customerPresenter = new CustomerPresenter();

  @override
  Widget build(BuildContext context) {

    customerPresenter.setCustomer(_customer);
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            "Item"
          ),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[

            

            Container(
              height: _height*0.45,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(_item.getPhotoUrl()),
                  fit: BoxFit.cover,
                )
              ),
            ),

            SizedBox(height: _height*0.03,),

            Text(

              _item.getName(),
              style: TextStyle(
              fontSize: _height * 0.035,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              )

            ),

            SizedBox(height: _height*0.03,),

            Text(

              "RM: " + _item.getPrice().toString() + "0",
              style: TextStyle(
              fontSize: _height * 0.035,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              )

            ),

            Padding(
              padding: EdgeInsets.only(top: 35.0),
              child: Container(
                alignment: Alignment.center,
                child: ButtonTheme(
                  minWidth: _width * 0.45,
                  height: _height * 0.06,
                  child: RaisedButton(
                    child: Text(
                      "Buy Item",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: _height * 0.02,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    onPressed: () {
                      customerPresenter.buyItem(context, _item);
                    }
                  ),
                ),
              ),
            )
            
          ],
        ),
         
        
      ),
    );
  }



}