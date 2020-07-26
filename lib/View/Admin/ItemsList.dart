import 'package:flutter/material.dart';
import 'package:najah_smartapp/Entity/Item.dart';
import 'package:najah_smartapp/Presenter/AdminPresenter.dart';

class ItemListScreen extends StatelessWidget {
  final List<Item> _itemsList;
  ItemListScreen(this._itemsList);
  

  @override
  Widget build(BuildContext context) {

    
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            "Items List"
          ),
          centerTitle: true,
        ),
        body: Container(
          child: ListView(
            children: _itemsList.map((item)=>itemRow(context,item)).toList()
          )
        ),
      ),
    );
  }


  Widget itemRow(BuildContext _context, Item item)
  {
    return Padding(
      padding: EdgeInsets.only(top: 12.0),
      child: Container(
        height: MediaQuery.of(_context).size.height * 0.075,
        color: Colors.blueGrey[800],
        child: Center(
          child: ListTile(
            leading: ClipOval(
                child: new SizedBox(
                  width: MediaQuery.of(_context).size.height * 0.06,
                  height: MediaQuery.of(_context).size.height * 0.06,
                  child: Image.network(
                    item.photoUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            title: Text(
                  item.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
            onTap: (){
               AdminPresenter().showItem(_context, item);
            },
            
          ),
        ),
      ),
    );
  }
}