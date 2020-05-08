import 'package:flutter/material.dart';
import 'package:najah_smartapp/CustomWidgets/AppLogo.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    super.initState();
    new Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacementNamed('/home'));
  }

  @override
  Widget build(BuildContext context) {

    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: Center(
          child: Container(
            width: _width * 0.8,
            height: _height * 0.8,
            child: ListView(
              children:<Widget>[ 
                Column(

                  children: <Widget>[

                    AppLogo(_height),

                    Container(
                      height: _height * 0.5,
                      child: Text(
                        "FITNESS CENTER",
                        style: TextStyle(
                          color: Colors.grey[100],
                          fontSize: _height * 0.02,
                          fontWeight: FontWeight.bold,
                        )
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                        strokeWidth: 7.0,
                      ),
                    ),

                  ],
                ),
              ]
            ),
          ),
        )
      ),
    );
  }
}
