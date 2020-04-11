import 'package:flutter/material.dart';
import 'Customer.dart';

class SettingPage extends StatefulWidget {

  
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  @override
  Widget build(BuildContext context) {

    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    bool _notifications = true;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Colors.green,
                    Colors.teal[600],
                  ]
                )
              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    
                    CircleAvatar(
                      backgroundImage: Customer().profilePicture,
                      maxRadius: _height * 0.065,
                    ),

                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(top: 35.0),
                        child: Container(
                          
                          height: _height * 0.15,
                          width: _width * 0.65,
                          child: Column(
                            children: <Widget>[
                              Text(
                                Customer().name ,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: _height * 0.03,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              
                              Padding(
                                padding: EdgeInsets.only(left: 12.0, top: 5.0),
                                child: Text(
                                  Customer().email,
                                  style: TextStyle(
                                    color: Colors.grey[300],
                                    fontSize: _height * 0.017,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            appListTile(context, Icons.account_circle, "Edit Profile", ""),

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
                          _notifications = false;
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

                        });
                      },
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 7.0),
              child: appListTile(context, Icons.lock, "Logout", "logoutSplashScreen"),
            ),

          ],
        ),
      ),
    );
  }

  Widget appListTile(BuildContext _context, IconData _icon, String _title, String action)
  {
    return Padding(
      padding: EdgeInsets.only(top: 5.0),
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
              Navigator.pushReplacementNamed(_context, action);
            },
          ),
        ),
      ),
    );
  }

}