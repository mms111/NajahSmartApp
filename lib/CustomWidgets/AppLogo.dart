import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {

  final double _height;

  AppLogo(this._height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height * 0.2,
      child: Image(
        image: AssetImage('assets/images/logo.png'),
        height: _height * 0.2,
      ),
    );
  }
}