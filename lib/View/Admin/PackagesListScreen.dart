import 'package:flutter/material.dart';
import 'package:najah_smartapp/Entity/Package.dart';
import 'package:najah_smartapp/Presenter/AdminPresenter.dart';

class PackagesListScreen extends StatelessWidget {
  final List<Package> _packagesList;
  PackagesListScreen(this._packagesList);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            "Packages List"
          ),
          centerTitle: true,
        ),
        body: Container(
          child: ListView(
            children: _packagesList.map((package)=>userRow(context,package)).toList()
          )
        ),
      ),
    );
  }

  Widget userRow(BuildContext context, Package package)
  {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Container(
        padding: EdgeInsets.all(8.0),
        color: Colors.blueGrey[800],
        child: Row(
          
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Text(
                (_packagesList.indexOf(package)+1).toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Text(
                package.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                package.validity,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                "RM" + package.price.toString() + "0",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline
                ),
              ),
            ),
             Expanded(
              flex: 2,
              child: InkWell(
                onTap: () {
                  AdminPresenter().deletPackage(context, package);
                },
                child: Text(
                  "Delete",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}