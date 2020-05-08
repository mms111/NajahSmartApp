import 'package:flutter/material.dart';
import 'package:najah_smartapp/Entity/Admin.dart';

class AdminSettingScreen extends StatefulWidget {
  final Admin _admin;
  AdminSettingScreen(this._admin);
  
  @override
  _AdminSettingScreenState createState() => _AdminSettingScreenState();
}

class _AdminSettingScreenState extends State<AdminSettingScreen> {

  bool _notifications = true;

  @override
  Widget build(BuildContext context) {

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
                      backgroundImage: widget._admin.profilePicture,
                      maxRadius: _height * 0.06,
                    ),

                    SizedBox(width: _width*0.05,),
                    
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget._admin.name ,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: _height * 0.03,
                            fontWeight: FontWeight.bold
                          ),
                        ),

                        SizedBox(height: _height*0.01,),

                        Text(
                          widget._admin.email,
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
                          _notifications = value;
                          if(_notifications==false)
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
              Navigator.pushReplacementNamed(_context, action);
            },
          ),
        ),
      ),
    );
  }

}