import 'package:flutter/material.dart';

class CustomerDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          title: Text("Dashboard"),
          centerTitle: true,
        ),
        body: Container(),
      ),
    );
  }
}