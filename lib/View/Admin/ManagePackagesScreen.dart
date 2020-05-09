import 'package:flutter/material.dart';
import 'package:najah_smartapp/CustomWidgets/AdminListTile.dart';

class ManagePackagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Manage Packages"),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            AdminListTile(context, Icons.add , "Add Package", "/addPackage" ),
            AdminListTile(context, Icons.view_list , "Packages List", "/packagesList" )
          ],
        )
      ),
    );
  }
}