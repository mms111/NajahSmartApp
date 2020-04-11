import 'package:flutter/material.dart';
import 'package:najah_smartapp/HomePage.dart';

class LogoutSplash extends StatefulWidget {
  @override
  _LogoutSplashState createState() => _LogoutSplashState();
}

class _LogoutSplashState extends State<LogoutSplash> {

  @override
  void initState(){

    super.initState();
    new Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) =>HomePage()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    strokeWidth: 7.0,
                ),

                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Loging out",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ),
                )

              ],
            ),
          )
        ),
      ),
    );
  }
}