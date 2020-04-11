import 'package:flutter/material.dart';
import 'CustomerDashboard.dart';
import 'CustomerProfile.dart';
import 'SettingPage.dart';
class AppBottomNavigationBar extends StatefulWidget {
  @override
  _AppBottomNavigationBarState createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {

  int _currentIndex = 0;
  final List<Widget> _screens = [
    CustomerDashboard(),
    CustomerProfile(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
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