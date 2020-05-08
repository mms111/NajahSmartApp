import 'package:flutter/material.dart';
import 'package:najah_smartapp/Entity/Admin.dart';
import 'AdminDashboardScreen.dart';
import 'AdminSettingScreen.dart';

class AdminAppBottomNavigationBar extends StatefulWidget {
  final Admin _admin;
  AdminAppBottomNavigationBar(this._admin);
  get admin => _admin;
  @override
  _AdminAppBottomNavigationBarState createState() => _AdminAppBottomNavigationBarState();
}

class _AdminAppBottomNavigationBarState extends State<AdminAppBottomNavigationBar> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      AdminDashboardScreen(widget.admin),
      AdminSettingScreen(widget.admin),
    ];
    return SafeArea(
      child: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          backgroundColor: Colors.green,
          selectedItemColor: Colors.white,
          items: [

            getItem(Icon(Icons.home),Text("Home")),
            getItem(Icon(Icons.settings), Text("Settings")),

          ],
          onTap: (index) {
            setState(() {
            _currentIndex = index; 
          });
      }
        )
      ),
    );
  }

  BottomNavigationBarItem getItem(Icon _icon, Text _text)
  {
    return BottomNavigationBarItem(
      icon: _icon,
      title: _text,
      backgroundColor: Colors.white,
      
    );
  }
  
}