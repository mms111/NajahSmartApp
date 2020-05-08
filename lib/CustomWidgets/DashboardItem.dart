import 'package:flutter/material.dart';

class DashboardItem extends StatelessWidget {
  final String _title;
  final IconData _icon;
  DashboardItem(this._icon, this._title);
  @override
  Widget build(BuildContext context) {

    double _height = MediaQuery.of(context).size.height;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
          Icon(
            _icon,
            color: Colors.white,
            size: _height*0.08,
          ),

          SizedBox(height: 15.0,),
          Text(
            _title,
            style: TextStyle(
              color: Colors.white,
              fontSize: _height*0.02,
              
            ),
          )
        ],
      ),
    );
  }
}