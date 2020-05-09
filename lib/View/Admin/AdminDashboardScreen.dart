import 'package:flutter/material.dart';
import 'package:najah_smartapp/Entity/Admin.dart';
import 'package:najah_smartapp/CustomWidgets/DashboardItem.dart';
import 'package:najah_smartapp/Presenter/AdminPresenter.dart';

class AdminDashboardScreen extends StatelessWidget {
  final Admin _admin;
  AdminDashboardScreen(this._admin);

  @override
  Widget build(BuildContext context) {

    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: _height*0.05),
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Colors.green,
                        Colors.blueGrey[800],
                      ]
                    )
                  ),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: _admin.profilePicture,
                        maxRadius: _height * 0.045,
                      ),

                      SizedBox(width: _width*0.05,),
                      
                      Text(
                        'Hi, ' + _admin.name ,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: _height * 0.025,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: _height *0.05,
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2
                      ),
                      delegate: SliverChildListDelegate(
                        [
                          Card(
                            elevation: 5.0,
                            margin: EdgeInsets.all(15.0),
                            color: Colors.blueGrey[800],
                            child: InkWell(
                              onTap: () {},
                              child: DashboardItem(Icons.people, "Manage Attendance")
                            ),
                          ),
                          Card(
                            elevation: 5.0,
                            margin: EdgeInsets.all(15.0),
                            color: Colors.blueGrey[800],
                            child: InkWell(
                              onTap: () {
                                AdminPresenter().onRequest(context, '/manageUsers');
                              },
                              child: DashboardItem(Icons.account_circle, "Manage Users")
                            ),
                          ),
                          Card(
                            elevation: 5.0,
                            margin: EdgeInsets.all(15.0),
                            color: Colors.blueGrey[800],
                            child: InkWell(
                              onTap: () {},
                              child: DashboardItem(Icons.shopping_cart, "Manage Shop")
                            ),
                          ),
                          Card(
                            elevation: 5.0,
                            margin: EdgeInsets.all(15.0),
                            color: Colors.blueGrey[800],
                            child: InkWell(
                              onTap: () {
                                AdminPresenter().onRequest(context, "/topUp");
                              },
                              child: DashboardItem(Icons.attach_money, "Top-up")
                            ),
                          ),
                          Card(
                            elevation: 5.0,
                            margin: EdgeInsets.all(15.0),
                            color: Colors.blueGrey[800],
                            child: InkWell(
                              onTap: () {
                                AdminPresenter().onRequest(context, '/selectFinancialReport');
                              },
                              child: DashboardItem(Icons.description, "Financial Report")
                            ),
                          ),
                          Card(
                            elevation: 5.0,
                            margin: EdgeInsets.all(15.0),
                            color: Colors.blueGrey[800],
                            child: InkWell(
                              onTap: () {
                                AdminPresenter().onRequest(context, '/managePackages');
                              },
                              child: DashboardItem(Icons.card_membership, "Manage Packages")
                            ),
                          ),
                        ]
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}