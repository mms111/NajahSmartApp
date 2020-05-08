import 'package:flutter/material.dart';

class LogoutSplashScreen extends StatefulWidget {
  @override
  _LogoutSplashScreenState createState() => _LogoutSplashScreenState();
}

class _LogoutSplashScreenState extends State<LogoutSplashScreen> {

  @override
  void initState(){

    super.initState();
    new Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.of(context).pushReplacementNamed('/home'));
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