import 'package:flutter/material.dart';
import 'package:najah_smartapp/Entity/Customer.dart';
import 'package:najah_smartapp/Presenter/CustomerPresenter.dart';

class CustomerSettingScreen extends StatefulWidget {
  final Customer _customer;
  CustomerSettingScreen(this._customer);
  
  
  @override
  _CustomerSettingScreenState createState() => _CustomerSettingScreenState();
}

class _CustomerSettingScreenState extends State<CustomerSettingScreen> {

  bool _notifications = true;
  CustomerPresenter customerPresenter = new CustomerPresenter();
  
  @override
  Widget build(BuildContext context) {

    customerPresenter.setCustomer(widget._customer);

    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Colors.green,
                    Colors.blueGrey[800],
                  ]
                )
              ),
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(widget._customer.photoUrl),
                      maxRadius: _height * 0.06,
                    ),

                    SizedBox(width: _width*0.05,),
                    
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget._customer.name ,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: _height * 0.03,
                            fontWeight: FontWeight.bold
                          ),
                        ),

                        SizedBox(height: _height*0.01,),

                        Text(
                          widget._customer.email,
                          style: TextStyle(
                            color: Colors.grey[300],
                            fontSize: _height * 0.017,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),

            appListTile(context, Icons.account_circle, "Edit Profile", "/editProfileScreen"),

            Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: Container(
                height: _height * 0.075,
                color: Colors.blueGrey[800],
                child: Center(
                  child: ListTile(
                    leading: Icon(
                      Icons.notifications,
                      size: _height * 0.035,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Notifications",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: _height * 0.02,
                      ),
                    ),
                    trailing: Switch(
                      value: _notifications,
                      activeColor: Colors.green,
                      onChanged: (value) {
                        setState(() {
                          _notifications = value;
                          if(_notifications == false)
                          {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(
                                "You turned off notifications.",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              duration: Duration(
                                seconds: 1,
                              ),
                              backgroundColor: Colors.blueGrey[800],
                            ));
                          }
                          else
                          {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(
                                "You turned on notifications.",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              duration: Duration(
                                seconds: 1,
                              ),
                              backgroundColor: Colors.blueGrey[800],
                            ));
                          }

                        });
                      },
                    ),
                  ),
                ),
              ),
            ),

            appListTile(context, Icons.lock, "Logout", "/logoutSplashScreen"),
            Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.075,
                color: Colors.blueGrey[800],
                child: Center(
                  child: ListTile(
                    leading: Icon(
                      Icons.delete,
                      size: MediaQuery.of(context).size.height * 0.035,
                      color: Colors.red,
                    ),
                    title: Text(
                      "Delete Account",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ),
                    onTap: () {
                      customerPresenter.deleteConfirmation(context);
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget appListTile(BuildContext _context, IconData _icon, String _title, String action)
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
            onTap: () {
              if(action=='/editProfileScreen')
              {
               
                customerPresenter.onRequest(context, action);
              }
              else
              {
                Navigator.pushReplacementNamed(_context, action);
              }
              
            },
          ),
        ),
      ),
    );
  }

}