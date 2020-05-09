import 'package:flutter/material.dart';
import 'package:najah_smartapp/Presenter/AdminPresenter.dart';

class AdminListTile extends StatelessWidget {

  final BuildContext _context; 
  final IconData _icon; 
  final String _title; 
  final String _action;

  AdminListTile(this._context, this._icon,  this._title, this._action);

  @override
  Widget build(BuildContext context) {
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
              AdminPresenter().onRequest(_context, _action);
            },
          ),
        ),
      ),
    );
  }
}