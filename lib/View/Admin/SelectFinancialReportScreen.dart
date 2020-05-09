import 'package:flutter/material.dart';
import 'package:najah_smartapp/Presenter/AdminPresenter.dart';

class SelectFinancialReportScreen extends StatefulWidget {
  @override
  _SelectFinancialReportScreenState createState() => _SelectFinancialReportScreenState();
}

class _SelectFinancialReportScreenState extends State<SelectFinancialReportScreen> {

  DateTime _fromDate;
  DateTime _tillDate;
  String _textHint1 ="Date from";
  String _textHint2 ="Date till";

  @override
  Widget build(BuildContext context) {

    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            "Financial Report",
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.only(top: _height*0.2),
          alignment: Alignment.center,
          child: Column( 
            children: <Widget>[
              Container(
                width: _width*0.9,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                      color: Colors.green
                  )
                ),

                child: TextFormField(
                  readOnly: true,
                  textAlignVertical: TextAlignVertical(y: 0.1),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: _textHint1,
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: _height * 0.02,
                    ),
                    prefixIcon: Icon(Icons.date_range, color: Colors.green,),
                    
                  ),
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2021),
                    ).then((date){
                      setState(() {
                        _fromDate=date;
                        _textHint1 = _fromDate.day.toString() + "/" +
                           _fromDate.month.toString() + "/" + _fromDate.year.toString();
                      });
                    });
                    
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  width: _width*0.9,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                        color: Colors.green
                    )
                  ),

                  child: TextFormField(
                    readOnly: true,
                    textAlignVertical: TextAlignVertical(y: 0.1),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: _textHint2,
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: _height * 0.02,
                      ),
                      prefixIcon: Icon(Icons.date_range, color: Colors.green,),
                      
                    ),
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2021),
                      ).then((date){
                        setState(() {
                          _tillDate=date;
                          _textHint2 = _tillDate.day.toString() + "/" +
                           _tillDate.month.toString() + "/" + _tillDate.year.toString();
                        });
                      });
                      
                    },
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: Container(
                  alignment: Alignment.center,
                  child: ButtonTheme(
                    minWidth: _width * 0.35,
                    height: _height * 0.06,
                    child: RaisedButton(
                      child: Text(
                        "Top-up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: _height * 0.02,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      onPressed: () {
                        AdminPresenter().onRequest(context, "/financialReport");
                      }
                    ),
                  ),
                ),
              )
              
            ],
          ),
        ),
      ),
    );
  }

}