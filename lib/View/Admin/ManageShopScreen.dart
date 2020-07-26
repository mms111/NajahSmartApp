import 'package:flutter/material.dart';
import 'package:najah_smartapp/CustomWidgets/AdminListTile.dart';

class ManageShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Manage Shop"),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            AdminListTile(context, Icons.add , "Add Item", "/addItem" ),
            AdminListTile(context, Icons.view_list , "Items List", "/itemsList" )
          ],
        )
      ),
    );
  }
}