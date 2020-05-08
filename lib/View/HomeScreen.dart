import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[

            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/homeBg.png'),
                  fit: BoxFit.cover,
                )
              ),
            ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: _height * 0.4,
                child: Column(
                  children: <Widget>[

                    Container(
                      
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 15.0, top: 15.0),
                      height: _height * 0.25,
                      child: Text(
                        "Life doesn't have \na remote, get-up \nand change it \nYOURSELF!",
                        style: TextStyle(
                        fontSize: _height * 0.035,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        )
                      ),
                    ),

                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 15.0, top: 15.0),
                      child: ButtonTheme(
                        minWidth: _width * 0.35,
                        height: _height * 0.06,
                        child: RaisedButton(
                          child: Text(
                            "Login",
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
                          onPressed: () {Navigator.of(context).pushNamed('/loginScreen');}
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )

            

          ],
        )
      ),
    );
  }
}