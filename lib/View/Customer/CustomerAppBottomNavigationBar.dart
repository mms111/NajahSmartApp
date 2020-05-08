import 'package:flutter/material.dart';
import 'CustomerDashboardScreen.dart';
import 'CustomerProfileScreen.dart';
import 'CustomerSettingScreen.dart';
import 'package:najah_smartapp/Entity/Customer.dart';

class CustomerAppBottomNavigationBar extends StatefulWidget {
  final Customer _customer;
  CustomerAppBottomNavigationBar(this._customer);
  get customer => _customer;
  @override
  _CustomerAppBottomNavigationBarState createState() => _CustomerAppBottomNavigationBarState();
}

class _CustomerAppBottomNavigationBarState extends State<CustomerAppBottomNavigationBar> {

  int _currentIndex = 0;
  

  @override
  Widget build(BuildContext context) {

    final List<Widget> _screens = [
      CustomerDashboardScreen(widget.customer),
      CustomerProfileScreen(widget.customer),
      CustomerSettingScreen(widget.customer),
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
            getItem(Icon(Icons.person),Text("Profile")),
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