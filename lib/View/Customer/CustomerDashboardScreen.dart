import 'package:flutter/material.dart';
import 'package:najah_smartapp/Entity/Customer.dart';
import 'package:najah_smartapp/CustomWidgets/DashboardItem.dart';
import 'package:najah_smartapp/Presenter/CustomerPresenter.dart';

class CustomerDashboardScreen extends StatelessWidget {
  final Customer _customer;
  CustomerDashboardScreen(this._customer);

  @override
  Widget build(BuildContext context) {

    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    CustomerPresenter customerPresenter = new CustomerPresenter();
    customerPresenter.setCustomer(_customer);

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
                        backgroundImage: NetworkImage(_customer.photoUrl),
                        maxRadius: _height * 0.045,
                      ),

                      SizedBox(width: _width*0.05,),
                      
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Hi, ' + _customer.name ,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: _height * 0.025,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: _height*0.01,),
                          Text(
                            'Credit: RM' + _customer.credit.toString() + '0' ,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: _height * 0.018,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
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
                              onTap: () {
                                customerPresenter.itemList(context);
                              },
                              child: DashboardItem(Icons.shopping_cart, "Shop")
                            ),
                          ),
                          Card(
                            elevation: 5.0,
                            margin: EdgeInsets.all(15.0),
                            color: Colors.blueGrey[800],
                            child: InkWell(
                              onTap: () {
                                 customerPresenter.onRequest(context, '/topUpScreen');
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
                                customerPresenter.onRequest(context, '/activitiesScreen');
                              },
                              child: DashboardItem(Icons.local_activity, "Activities")
                            ),
                          ),
                          Card(
                            elevation: 5.0,
                            margin: EdgeInsets.all(15.0),
                            color: Colors.blueGrey[800],
                            child: InkWell(
                              onTap: () {
                                customerPresenter.onRequest(context, "/editProfileScreen");
                              },
                              child: DashboardItem(Icons.account_circle, "Edit Profile")
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