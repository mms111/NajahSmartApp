import 'package:flutter/material.dart';
import 'package:najah_smartapp/Entity/Customer.dart';

class CustomerProfileScreen extends StatelessWidget {
  final Customer _customer;
  CustomerProfileScreen(this._customer);

  @override
  Widget build(BuildContext context) {
  BuildContext _context = context;
  double _height = MediaQuery.of(context).size.height;
  double _width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: Stack(
          children: <Widget>[

            Container(
              height:_height * 0.15,
              width: _width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Colors.green,
                    Colors.blueGrey[800],
                  ]
                )
              ),
            ),

            Container(
              height: _height * 0.3,
              child: Column(
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.only(top: 45.0),
                    child: Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.blueGrey[900],
                        maxRadius: _height * 0.075,
                        child: CircleAvatar(
                         backgroundImage: NetworkImage(_customer.photoUrl),
                          maxRadius: _height * 0.07,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      _customer.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: _height * 0.035, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  
                  
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: _height * 0.3),
              child: Container(
                height: _height * 0.7,
                child: ListView(
                  children: <Widget>[

                    listView(_context, Icons.monetization_on, "Credit: RM" + _customer.credit.toString() + "0"),
                    listView(_context, Icons.email, _customer.email),
                    listView(_context, Icons.phone, _customer.phone),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget listView(BuildContext _context, IconData _icon, String _title)
  {
    return Padding(
      padding: EdgeInsets.only(top: 12.0),
      child: Container(
        height: MediaQuery.of(_context).size.height * 0.075,
        color: Colors.blueGrey[800],
        child: Center(
          child: ListTile(
            leading: Icon(
              _icon,
              size: MediaQuery.of(_context).size.height * 0.035,
              color: Colors.white,
            ),
            title: Text(
              _title,
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(_context).size.height * 0.02,
              ),
            ),
          ),
        ),
      ),
    );
  }
}