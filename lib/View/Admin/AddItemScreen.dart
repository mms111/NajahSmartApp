import 'package:flutter/material.dart';
import 'package:najah_smartapp/CustomWidgets/AlertDialogBox.dart';
import 'package:najah_smartapp/CustomWidgets/InputTextField.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:najah_smartapp/View/Admin/AddItemSplashScreen.dart';

class AddItemScreen extends StatefulWidget {
  

  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  
  File _image;
  final _additemFormKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;

      });
    }
    
    
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            "Add Item"
          ),
          centerTitle: true,
        ),
        
        body: Center(
          child: Container(
            width: _width * 0.9,
            height: _height * 0.7,
            child: Form(
              key: _additemFormKey,
              child: ListView(
                
                children: <Widget>[

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.green,
                          child: ClipOval(
                            child: new SizedBox(
                              width: 145.0,
                              height: 145.0,
                              child: (_image!=null)?Image.file(
                                _image,
                                fit: BoxFit.fill,
                              ):Image.network(
                                'https://firebasestorage.googleapis.com/v0/b/najah-smart-app-map.appspot.com/o/shopping.png?alt=media&token=a2316ace-82f4-4d8e-bc88-feab440b4af3',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 60.0),
                        child: IconButton(
                          icon: Icon(
                            Icons.photo_camera,
                            size: 30.0,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            getImage();
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: _height * 0.05,
                  ),

                  InputTextField(
                    Icon(Icons.person, color: Colors.green,),
                    "Name",
                    _nameController,
                    false,
                    TextInputType.text
                  ),

                  Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      child: InputTextField(
                        Icon(Icons.attach_money, color: Colors.green,),
                        "Price", 
                        _priceController, 
                        false,
                        TextInputType.number,
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
                            "Add Item",
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
                            
                            if(_additemFormKey.currentState.validate())
                            {
                              if(_image==null)
                              {
                                return AlertDialogBox(context, "Alert!", "Please choose image for the item.");
                              }
                              else
                              {
                                Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => AddItemSplashScreen(
                                  _image,_nameController.text, double.parse(_priceController.text))));
                              }

                            }
                          }
                        ),
                      ),
                    ),
                  )

                ],

              ),
            ),
          ),
        )
        
      ),
    );
  }
}
