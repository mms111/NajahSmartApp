import 'package:flutter/material.dart';
import 'package:najah_smartapp/Entity/Customer.dart';
import 'package:najah_smartapp/Presenter/CustomerPresenter.dart';

class DeleteAccountSplashScreen extends StatefulWidget {

  final Customer _customer;
  DeleteAccountSplashScreen(this._customer);
  CustomerPresenter customerPresenter = new CustomerPresenter();
  @override
  _DeleteAccountSplashScreenState createState() => _DeleteAccountSplashScreenState();
}

class _DeleteAccountSplashScreenState extends State<DeleteAccountSplashScreen> {
  

  @override
  void initState(){

    super.initState();
    new Future.delayed(
        const Duration(seconds: 2),
        () => widget.customerPresenter.deleteUser(context));
  }

  @override
  Widget build(BuildContext context) {

    widget.customerPresenter.setCustomer(widget._customer);

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
                    "Deleting Account",
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