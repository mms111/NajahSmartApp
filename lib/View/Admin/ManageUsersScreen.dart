import 'package:flutter/material.dart';
import 'package:najah_smartapp/Presenter/AdminPresenter.dart';

class ManageUsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            "Manage Users",
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            appListTile(context, Icons.add , "Add User", "/addUser" ),
            appListTile(context, Icons.view_list , "Users List", "/usersList" )
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
              AdminPresenter().onRequest(_context, action);
            },
          ),
        ),
      ),
    );
  }
}