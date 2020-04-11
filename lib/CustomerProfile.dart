import 'package:flutter/material.dart';
import 'Customer.dart';

class CustomerProfile extends StatelessWidget {
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
                          backgroundImage: Customer().profilePicture,
                          maxRadius: _height * 0.07,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      Customer().name,
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

                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: listView(_context, Icons.monetization_on, "Credit: RM100"),
                    ),

                    listView(_context, Icons.person_pin_circle, "Status: Active"),
                    listView(_context, Icons.card_membership, "Exp: 20/05/2020"),
                    listView(_context, Icons.email, Customer().email),
                    listView(_context, Icons.phone, Customer().phone),
                    
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